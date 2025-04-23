import 'package:fam_assignment/core/services/preferences_service.dart';
import 'package:fam_assignment/core/utils/assets.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/cta_button.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/formatted_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC3Card extends StatefulWidget {
  final CardGroupModel cardGroup;

  const HC3Card({
    super.key,
    required this.cardGroup,
  });

  @override
  State<HC3Card> createState() => _HC3CardState();
}

class _HC3CardState extends State<HC3Card> {
  bool isSelected = false;
  bool _isReminded = false;
  bool _isDismissed = false;
  final _preferencesService = PreferencesService();

  @override
  void initState() {
    super.initState();
    _loadCardStatus();
    if (widget.cardGroup.cards.isNotEmpty) {
      final cardId = widget.cardGroup.cards.first.id.toString();
      _preferencesService.clearReminderStatus(cardId);
    }
  }

  Future<void> _loadCardStatus() async {
    if (widget.cardGroup.cards.isNotEmpty) {
      final cardId = widget.cardGroup.cards.first.id.toString();
      final reminderStatus = await _preferencesService.getReminderStatus(cardId);
      final dismissStatus = await _preferencesService.getDismissStatus(cardId);
      if (mounted) {
        setState(() {
          _isReminded = reminderStatus ?? false;
          _isDismissed = dismissStatus ?? false;
        });
      }
    }
  }

  Future<void> _toggleReminder() async {
    if (widget.cardGroup.cards.isNotEmpty) {
      final cardId = widget.cardGroup.cards.first.id.toString();
      final newStatus = true; // Set to true to hide the card
      final success = await _preferencesService.setReminderStatus(
        cardId,
        newStatus,
      );
      
      if (success && mounted) {
        setState(() {
          _isReminded = newStatus;
          isSelected = false;
        });
      }
    }
  }

  Future<void> _handleDismiss() async {
    if (widget.cardGroup.cards.isNotEmpty) {
      final cardId = widget.cardGroup.cards.first.id.toString();
      final success = await _preferencesService.setDismissStatus(
        cardId,
        true,
      );
      
      if (success && mounted) {
        setState(() {
          _isDismissed = true;
          isSelected = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cardGroup.cards.isEmpty || _isDismissed || _isReminded) {
      return const SizedBox.shrink();
    }

    final card = widget.cardGroup.cards.first;
    final double space = (MediaQuery.sizeOf(context).width - 80) / 2;

    return SizedBox(
      height: widget.cardGroup.height?.toDouble(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            left: isSelected ? space : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: GestureDetector(
              onLongPress: () => setState(() => isSelected = !isSelected),
              onTap: () async {
                if (!isSelected && card.url != null) {
                  final Uri uri = Uri.parse(card.url!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                }
              },
              child: Container(
                height: widget.cardGroup.height?.toDouble(),
                width: MediaQuery.sizeOf(context).width - 16,
                decoration: BoxDecoration(
                  color: card.bgColor != null 
                      ? Color(int.parse(card.bgColor!.replaceAll('#', '0xFF'))) 
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  image: card.bgImage?.imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(card.bgImage!.imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (card.formattedTitle != null)
                          FormattedTextWidget(
                            formattedText: card.formattedTitle!,
                          ),
                        if (card.formattedDescription != null) ...[
                          const SizedBox(height: 8),
                          FormattedTextWidget(
                            formattedText: card.formattedDescription!,
                          ),
                        ],
                        if (card.cta != null && card.cta!.isNotEmpty) ...[
                          SizedBox(height: widget.cardGroup.height! * 0.2),
                          Row(
                            children: card.cta!
                                .map((cta) => Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: CTAButton(cta: cta),
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: widget.cardGroup.height! * 0.1),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              left: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(
                    onTap: _toggleReminder,
                    icon: AppImages.bell,
                    label: 'remind later',
                  ),
                  const SizedBox(height: 8),
                  _buildActionButton(
                    onTap: _handleDismiss,
                    icon: AppImages.dismiss,
                    label: 'dismiss now',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onTap,
    required String icon,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  icon,
                  width: 16,
                  height: 16,
                  color: const Color(0xFFFFB800),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

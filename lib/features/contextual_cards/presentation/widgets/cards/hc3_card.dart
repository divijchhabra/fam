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
      final newStatus = !_isReminded;
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
    if (widget.cardGroup.cards.isEmpty || _isDismissed) {
      return const SizedBox.shrink();
    }

    final card = widget.cardGroup.cards.first;
    final bgColor = card.bgColor != null 
        ? Color(int.parse(card.bgColor!.replaceAll('#', '0xFF'))) 
        : Colors.white;
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
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (card.bgImage != null) ...[
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: AspectRatio(
                          aspectRatio: card.bgImage?.aspectRatio ?? 0.9142857,
                          child: Image.network(
                            card.bgImage?.imageUrl ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (card.formattedTitle != null) ...[
                            FormattedTextWidget(formattedText: card.formattedTitle!),
                            const SizedBox(height: 8),
                          ],
                          if (card.formattedDescription != null) ...[
                            FormattedTextWidget(formattedText: card.formattedDescription!),
                            const SizedBox(height: 16),
                          ],
                          if (card.cta != null && card.cta!.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: card.cta!
                                  .map((cta) => Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: CTAButton(cta: cta),
                                      ))
                                  .toList(),
                            ),
                        ],
                      ),
                    ),
                  ],
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
                  color: const Color(0xFFFFB800), // Yellow/gold color
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
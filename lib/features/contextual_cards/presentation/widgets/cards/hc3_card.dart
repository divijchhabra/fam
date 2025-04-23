import 'package:fam_assignment/core/utils/assets.dart';
import 'package:fam_assignment/core/utils/url_launcher.dart';
import 'package:fam_assignment/features/contextual_cards/bloc/contextual_cards_bloc.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/contextual_card_presentation_model.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/cta_button.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/formatted_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    if (widget.cardGroup.cards.isEmpty) {
      return const SizedBox.shrink();
    }

    final card = widget.cardGroup.cards.first;
    final bloc = BlocProvider.of<ContextualCardsBloc>(context);
    final double space = (MediaQuery.sizeOf(context).width - 80) / 2;

    return SizedBox(
      height: widget.cardGroup.height.toDouble(),
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
                if (!isSelected) {
                  await UrlLauncher.launch(card.url);
                }
              },
              child: Container(
                height: widget.cardGroup.height.toDouble(),
                width: MediaQuery.sizeOf(context).width - 16,
                decoration: BoxDecoration(
                  color: Color(int.parse(card.bgColor.replaceAll('#', '0xFF'))),
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(card.bgImage.imageUrl),
                    fit: BoxFit.cover,
                  ),
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
                        FormattedTextWidget(
                          formattedText: card.formattedTitle,
                        ),
                        const SizedBox(height: 8),
                        FormattedTextWidget(
                          formattedText: card.formattedDescription,
                        ),
                        SizedBox(height: widget.cardGroup.height * 0.2),
                        Row(
                          children: card.cta
                              .map((cta) => Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: CTAButton(cta: cta),
                                  ))
                              .toList(),
                        ),
                        SizedBox(height: widget.cardGroup.height * 0.1),
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
                    onTap: () {
                      bloc.add(SetReminderHC3Card(cardId: card.id, hasReminder: true));
                      setState(() => isSelected = false);
                    },
                    icon: AppImages.bell,
                    label: 'remind later',
                  ),
                  const SizedBox(height: 8),
                  _buildActionButton(
                    onTap: () {
                      bloc.add(DismissHC3Card(cardId: card.id));
                      setState(() => isSelected = false);
                    },
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

import 'package:fam_assignment/core/utils/url_launcher.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/formatted_text_widget.dart';
import 'package:flutter/material.dart';

class HC1Card extends StatelessWidget {
  final CardGroupModel cardGroup;

  const HC1Card({
    super.key,
    required this.cardGroup,
  });

  @override
  Widget build(BuildContext context) {
    if (cardGroup.cards.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: (cardGroup.height.toDouble()) * 1.3,
        child: cardGroup.isScrollable == true
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardGroup.cards.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final card = cardGroup.cards[index];
                  return _buildHc1Card(context, card);
                },
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: cardGroup.cards
                      .map((card) => _buildHc1Card(context, card))
                      .toList(),
                ),
              ),
      ),
    );
  }

  Widget _buildHc1Card(BuildContext context, CardModel card) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = cardGroup.isFullWidth == true
        ? screenWidth - 24
        : cardGroup.isScrollable == true
            ? screenWidth * 0.8
            : (screenWidth - 80 - (8 * (cardGroup.cards.length - 1))) /
                cardGroup.cards.length; // Fit all cards with equal spacing

    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(
        right: cardGroup.isScrollable == true ? 8.0 : 0.0,
      ),
      child: GestureDetector(
        onTap: () async {
          await UrlLauncher.launch(card.url);
        },
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Color(int.parse(card.bgColor.replaceAll('#', '0xFF'))),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    card.icon.imageUrl,
                    fit: BoxFit.cover,
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (card.formattedTitle.text.trim().isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: FormattedTextWidget(
                            formattedText: card.formattedTitle,
                          ),
                        ),
                      if (card.formattedDescription.text.trim().isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: FormattedTextWidget(
                            formattedText: card.formattedDescription,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

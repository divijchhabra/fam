import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/formatted_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        height: (cardGroup.height?.toDouble() ?? 0) * 1.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cardGroup.cards.length,
          itemBuilder: (context, index) {
            final card = cardGroup.cards[index];
            return _buildHc1Card(context, card);
          },
        ),
      ),
    );
  }

  Widget _buildHc1Card(BuildContext context, CardModel card) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () async {
          if (card.url != null) {
            final Uri uri = Uri.parse(card.url!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          }
        },
        child: Container(
          height: 64,
          width: cardGroup.isScrollable == true
              ? MediaQuery.sizeOf(context).width - 20
              : (MediaQuery.sizeOf(context).width - 20) / 2,
          decoration: BoxDecoration(
            color: card.bgColor != null ? Color(int.parse(card.bgColor!.replaceAll('#', '0xFF'))) : Colors.white,
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
                    card.icon?.imageUrl ?? "https://hok.famapp.co.in/hok-assets/feedMedia/ext/5435b4ee-a962-4531-95d5-889e4038eece-1734193661283.webp",
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
                      if (card.formattedTitle != null && card.formattedTitle!.text.trim().isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: FormattedTextWidget(
                            formattedText: card.formattedTitle!,
                          ),
                        ),
                      if (card.formattedDescription != null && card.formattedDescription!.text.trim().isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: FormattedTextWidget(
                            formattedText: card.formattedDescription!,
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

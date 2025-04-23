import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/formatted_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC6Card extends StatelessWidget {
  final CardGroupModel cardGroup;

  const HC6Card({
    super.key,
    required this.cardGroup,
  });

  @override
  Widget build(BuildContext context) {
    if (cardGroup.cards.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: cardGroup.height?.toDouble() ?? 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 12.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cardGroup.cards.length,
          itemBuilder: (context, index) {
            final card = cardGroup.cards[index];
            return _buildHc6Card(context, card);
          },
        ),
      ),
    );
  }

  Widget _buildHc6Card(BuildContext context, CardModel card) {
    return GestureDetector(
      onTap: () async {
        if (card.url != null) {
          final Uri uri = Uri.parse(card.url!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      },
      child: Container(
        width:
            (MediaQuery.sizeOf(context).width - 32) / (cardGroup.cards.length),
        height: cardGroup.height?.toDouble() ?? 0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: card.bgColor != null
              ? Color(int.parse(card.bgColor!.replaceAll('#', '0xFF')))
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  card.icon?.imageUrl ?? "",
                  fit: BoxFit.cover,
                  width: (card.iconSize?.toDouble() ?? 16) * 2,
                  height: (card.iconSize?.toDouble() ?? 16) * 2,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: card.formattedTitle != null &&
                        card.formattedTitle!.text.trim().isNotEmpty
                    ? FormattedTextWidget(
                        formattedText: card.formattedTitle!,
                      )
                    : null,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}

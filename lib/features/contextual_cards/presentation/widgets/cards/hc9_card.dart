import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC9Card extends StatelessWidget {
  final CardGroupModel cardGroup;

  const HC9Card({
    super.key,
    required this.cardGroup,
  });

  @override
  Widget build(BuildContext context) {
    if (cardGroup.cards.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: SizedBox(
          height: (cardGroup.height?.toDouble() ?? 0) * 1.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cardGroup.cards.length,
            itemBuilder: (context, index) {
              final card = cardGroup.cards[index];
              return _buildHc9Card(context, card);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHc9Card(BuildContext context, CardModel card) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () async {
          if (card.url != null) {
            final Uri uri = Uri.parse(card.url!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: card.bgImage?.aspectRatio ?? 1.5,
            child: Container(
              decoration: BoxDecoration(
                gradient: card.bgGradient?.colors?.isNotEmpty == true
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: card.bgGradient!.colors!
                            .map((color) => Color(int.parse(color.replaceAll('#', '0xFF'))))
                            .toList(),
                      )
                    : null,
              ),
              child: card.bgImage?.imageUrl != null
                  ? Image.network(
                      card.bgImage!.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
} 
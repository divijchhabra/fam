import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC5Card extends StatelessWidget {
  final CardGroupModel cardGroup;

  const HC5Card({
    super.key,
    required this.cardGroup,
  });

  @override
  Widget build(BuildContext context) {
    if (cardGroup.cards.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardGroup.cards.length,
        itemBuilder: (context, index) {
          final card = cardGroup.cards[index];
          return _buildHc5Card(context, card);
        },
      ),
    );
  }

  Widget _buildHc5Card(BuildContext context, CardModel card) {
    return GestureDetector(
      onTap: () async {
        if (card.url != null) {
          final Uri uri = Uri.parse(card.url!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          card.bgImage?.imageUrl ?? "",
          fit: BoxFit.cover,
          width: MediaQuery.sizeOf(context).width - 16,
        ),
      ),
    );
  }
} 
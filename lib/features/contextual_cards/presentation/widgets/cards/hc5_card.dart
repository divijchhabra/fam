import 'package:fam_assignment/core/utils/url_launcher.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/contextual_card_presentation_model.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/formatted_text_widget.dart';
import 'package:flutter/material.dart';

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
        await UrlLauncher.launch(card.url);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          card.bgImage.imageUrl,
          fit: BoxFit.cover,
          width: MediaQuery.sizeOf(context).width - 16,
        ),
      ),
    );
  }
} 
import 'package:fam_assignment/core/utils/url_launcher.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/common/formatted_text_widget.dart';
import 'package:flutter/material.dart';

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

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 12.0),
      child: SizedBox(
        height: 32,
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
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 16,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 24,
          ),
          tileColor: Color(int.parse(card.bgColor.replaceAll('#', '0xFF'))),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              card.icon.imageUrl,
              fit: BoxFit.cover,
              width: card.iconSize * 2,
              height: card.iconSize * 2,
            ),
          ),
          title: FormattedTextWidget(formattedText: card.formattedTitle),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: () async {
            await UrlLauncher.launch(card.url);
          },
        ),
      ),
    );
  }
}

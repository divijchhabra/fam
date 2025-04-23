import 'package:flutter/material.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:fam_assignment/features/contextual_cards/data/enums/design_type.dart';
import '../cards/hc1_card.dart';
import '../cards/hc3_card.dart';
import '../cards/hc5_card.dart';
import '../cards/hc6_card.dart';
import '../cards/hc9_card.dart';

class CardGroupWidget extends StatelessWidget {
  final CardGroupModel cardGroup;

  const CardGroupWidget({
    super.key,
    required this.cardGroup,
  });

  @override
  Widget build(BuildContext context) {
    switch (cardGroup.designType) {
      case DesignType.hc1:
        return HC1Card(cardGroup: cardGroup);
      case DesignType.hc3:
        return HC3Card(cardGroup: cardGroup);
      case DesignType.hc5:
        return HC5Card(cardGroup: cardGroup);
      case DesignType.hc6:
        return HC6Card(cardGroup: cardGroup);
      case DesignType.hc9:
        return HC9Card(cardGroup: cardGroup);
      default:
        return const SizedBox.shrink();
    }
  }
} 
import 'package:flutter/material.dart';
import 'package:fam_assignment/features/contextual_cards/data/enums/slug_type.dart';
import '../contextual_cards_page.dart';

class ContextualCardsLayoutProvider extends StatelessWidget {
  final SlugType slugType;

  const ContextualCardsLayoutProvider({
    super.key,
    required this.slugType,
  });

  @override
  Widget build(BuildContext context) {
    return ContextualCardsPage(slugType: slugType);
  }
} 
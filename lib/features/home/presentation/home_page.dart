import 'package:fam_assignment/features/contextual_cards/data/enums/slug_type.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/contextual_cards_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/logo/fampaylogo.png'),
      ),
      body: const ContextualCardsLayoutProvider(
        slugType: SlugType.famXPay,
      ),
    );
  }
}

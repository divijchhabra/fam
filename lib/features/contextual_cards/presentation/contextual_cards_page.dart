import 'package:fam_assignment/core/di/fam_di.dart';
import 'package:fam_assignment/features/contextual_cards/bloc/contextual_cards_bloc.dart';
import 'package:fam_assignment/features/contextual_cards/data/enums/slug_type.dart';
import 'package:fam_assignment/features/contextual_cards/presentation/widgets/card_groups/card_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class ContextualCardsPage extends StatelessWidget {
  final SlugType slugType;

  const ContextualCardsPage({
    super.key,
    required this.slugType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FamDI.instance.get<ContextualCardsBloc>()
        ..add(FetchContextualCards(slugType: slugType)),
      child: Scaffold(
        body: BlocBuilder<ContextualCardsBloc, ContextualCardsState>(
          builder: (context, state) {
            if (state is ContextualCardsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ContextualCardsLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<ContextualCardsBloc>(context)
                      .add(FetchContextualCards(slugType: slugType));
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.cards.length,
                  itemBuilder: (context, index) {
                    final cardGroup = state.cards[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CardGroupWidget(cardGroup: cardGroup),
                    );
                  },
                ),
              );
            }

            if (state is ContextualCardsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ContextualCardsBloc>(context)
                            .add(FetchContextualCards(slugType: slugType));
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

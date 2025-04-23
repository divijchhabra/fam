import 'package:fam_assignment/features/contextual_cards/bloc/contextual_cards_event.dart';
import 'package:fam_assignment/features/contextual_cards/bloc/contextual_cards_state.dart';
import 'package:fam_assignment/features/contextual_cards/repository/contextual_cards_repository_contract.dart';
import 'package:fam_assignment/features/contextual_cards/data/enums/design_type.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContextualCardsBloc
    extends Bloc<ContextualCardsEvent, ContextualCardsState> {
  final ContextualCardsRepositoryContract repository;
  final SharedPreferences prefs;

  ContextualCardsBloc({
    required this.repository,
    required this.prefs,
  }) : super(ContextualCardsInitial()) {
    on<LoadContextualCards>(_onLoadContextualCards);
    on<FetchContextualCards>(_onFetchContextualCards);
    on<DismissHC3Card>(_onDismissCard);
    on<SetReminderHC3Card>(_onSetReminderCard);
  }

  Future<void> _onLoadContextualCards(
    LoadContextualCards event,
    Emitter<ContextualCardsState> emit,
  ) async {
    try {
      emit(ContextualCardsLoading());
      final cards = await repository.getContextualCards(event.slugType);
      final filteredCards = await _filterDismissedCards(cards);
      emit(ContextualCardsLoaded(cards: filteredCards));
    } catch (e) {
      emit(ContextualCardsError(message: e.toString()));
    }
  }

  Future<void> _onFetchContextualCards(
    FetchContextualCards event,
    Emitter<ContextualCardsState> emit,
  ) async {
    try {
      emit(ContextualCardsLoading());
      final cards = await repository.getContextualCards(event.slugType);
      final filteredCards = await _filterDismissedCards(cards);
      emit(ContextualCardsLoaded(cards: filteredCards));
    } catch (e) {
      emit(ContextualCardsError(message: e.toString()));
    }
  }

  Future<List<CardGroupModel>> _filterDismissedCards(
      List<CardGroupModel> cards) async {
    return cards.map((group) {
      if (group.designType == DesignType.hc3) {
        final updatedGroupCards = group.cards.where((card) {
          final isDismissed = prefs.getBool('dismiss_${card.id}') ?? false;
          return !isDismissed;
        }).toList();
        return group.copyWith(cards: updatedGroupCards);
      }
      return group;
    }).toList();
  }

  Future<void> _onDismissCard(
    DismissHC3Card event,
    Emitter<ContextualCardsState> emit,
  ) async {
    if (state is ContextualCardsLoaded) {
      final currentState = state as ContextualCardsLoaded;
      await prefs.setBool('dismiss_${event.cardId}', true);

      final filteredCards = await _filterDismissedCards(currentState.cards);
      emit(ContextualCardsLoaded(cards: filteredCards));
    }
  }

  Future<void> _onSetReminderCard(
    SetReminderHC3Card event,
    Emitter<ContextualCardsState> emit,
  ) async {
    if (state is ContextualCardsLoaded) {
      final currentState = state as ContextualCardsLoaded;

      final updatedCards = currentState.cards.map((group) {
        final updatedGroupCards =
            group.cards.where((card) => card.id != event.cardId).toList();
        return group.copyWith(cards: updatedGroupCards);
      }).toList();

      emit(currentState.copyWith(cards: updatedCards));
    }
  }
}

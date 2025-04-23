import 'package:fam_assignment/features/contextual_cards/bloc/contextual_cards_event.dart';
import 'package:fam_assignment/features/contextual_cards/bloc/contextual_cards_state.dart';
import 'package:fam_assignment/features/contextual_cards/repository/contextual_cards_repository_contract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContextualCardsBloc
    extends Bloc<ContextualCardsEvent, ContextualCardsState> {
  final ContextualCardsRepositoryContract repository;

  ContextualCardsBloc({required this.repository})
      : super(ContextualCardsInitial()) {
    on<LoadContextualCards>(_onLoadContextualCards);
    on<FetchContextualCards>(_onFetchContextualCards);
  }

  Future<void> _onLoadContextualCards(
    LoadContextualCards event,
    Emitter<ContextualCardsState> emit,
  ) async {
    try {
      emit(ContextualCardsLoading());
      final cards = await repository.getContextualCards(event.slugType);
      emit(ContextualCardsLoaded(cards: cards));
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
      emit(ContextualCardsLoaded(cards: cards));
    } catch (e) {
      emit(ContextualCardsError(message: e.toString()));
    }
  }
}

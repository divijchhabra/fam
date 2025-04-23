import 'package:equatable/equatable.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';

abstract class ContextualCardsState extends Equatable {
  const ContextualCardsState();

  @override
  List<Object> get props => [];
}

class ContextualCardsInitial extends ContextualCardsState {}

class ContextualCardsLoading extends ContextualCardsState {}

class ContextualCardsLoaded extends ContextualCardsState {
  final List<CardGroupModel> cards;

  const ContextualCardsLoaded({required this.cards});

  @override
  List<Object> get props => [cards];

  ContextualCardsLoaded copyWith({
    List<CardGroupModel>? cards,
  }) {
    return ContextualCardsLoaded(
      cards: cards ?? this.cards,
    );
  }
}

class ContextualCardsError extends ContextualCardsState {
  final String message;

  const ContextualCardsError({required this.message});

  @override
  List<Object> get props => [message];
} 
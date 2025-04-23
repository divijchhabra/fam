part of 'contextual_cards_bloc.dart';

abstract class ContextualCardsEvent extends Equatable {
  const ContextualCardsEvent();

  @override
  List<Object> get props => [];
}

class LoadContextualCards extends ContextualCardsEvent {
  final SlugType slugType;
  
  const LoadContextualCards({required this.slugType});

  @override
  List<Object> get props => [slugType];
}

class FetchContextualCards extends ContextualCardsEvent {
  final SlugType slugType;
  
  const FetchContextualCards({required this.slugType});

  @override
  List<Object> get props => [slugType];
}

class DismissHC3Card extends ContextualCardsEvent {
  final int cardId;
  
  const DismissHC3Card({required this.cardId});

  @override
  List<Object> get props => [cardId];
}

class SetReminderHC3Card extends ContextualCardsEvent {
  final int cardId;
  final bool hasReminder;
  
  const SetReminderHC3Card({
    required this.cardId,
    required this.hasReminder,
  });

  @override
  List<Object> get props => [cardId, hasReminder];
}

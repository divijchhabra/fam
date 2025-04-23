import 'package:equatable/equatable.dart';
import 'package:fam_assignment/features/contextual_cards/data/enums/slug_type.dart';

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

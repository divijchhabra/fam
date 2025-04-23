import 'package:fam_assignment/features/contextual_cards/data/enums/slug_type.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';

abstract class ContextualCardsRepositoryContract {
  Future<List<CardGroupModel>> getContextualCards(SlugType slug);
} 
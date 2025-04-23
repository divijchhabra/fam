import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import '../data/enums/slug_type.dart';

abstract class ContextualCardsRepositoryContract {
  Future<List<CardGroupModel>> getContextualCards(SlugType slug);
} 
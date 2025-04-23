import 'package:fam_assignment/core/api/api_config.dart';
import 'package:fam_assignment/core/network/base_request.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/network_models/contextual_cards_network_model.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/contextual_card_presentation_model.dart';
import 'package:fam_assignment/features/contextual_cards/data/mappers/contextual_card_mapper.dart';
import 'package:fam_assignment/features/contextual_cards/data/enums/slug_type.dart';
import 'package:fam_assignment/features/contextual_cards/repository/contextual_cards_repository_contract.dart';

class ContextualCardsRepositoryImpl implements ContextualCardsRepositoryContract {
  final WebService _webService;

  ContextualCardsRepositoryImpl({required WebService webService}) : _webService = webService;

  @override
  Future<List<CardGroupModel>> getContextualCards(SlugType slug) async {
    try {
      final response = await _webService.get(
        endpoint: ApiConfig.contextualCardsEndpoint,
        queryParams: {'slugs': slug.name},
      );

      if (response is List && response.isNotEmpty) {
        final networkModel = ContextualCardResponseNetworkModel.fromJson({'cardGroups': response[0]['hc_groups']});
        return networkModel.toPresentation();
      }
      throw Exception('No data received');
    } catch (e) {
      throw Exception('Failed to load contextual cards: $e');
    }
  }
}

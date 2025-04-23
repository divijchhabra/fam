import 'dart:convert';

import 'package:fam_assignment/core/api/api_config.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/contextual_card_response.dart';
import 'package:http/http.dart' as http;

class ContextualCardsRepository {
  final http.Client _client;

  ContextualCardsRepository({required http.Client client}) : _client = client;

  Future<ContextualCardResponseNetworkModel> getContextualCards(String slug) async {
    try {
      final uri = Uri.parse(ApiConfig.baseUrl + ApiConfig.contextualCardsEndpoint)
          .replace(queryParameters: {'slugs': slug});

      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return ContextualCardResponseNetworkModel.fromJson({'cardGroups': data[0]['hc_groups']});
        }
        throw Exception('No data received');
      }
      throw Exception('Failed to load contextual cards: ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to load contextual cards: $e');
    }
  }

  void dispose() {
    _client.close();
  }
} 
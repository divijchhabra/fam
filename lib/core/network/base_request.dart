import 'dart:convert';

import 'package:fam_assignment/core/api/api_config.dart';
import 'package:http/http.dart' as http;

class WebService {
  final http.Client _client;

  WebService({required http.Client client}) : _client = client;

  Future<dynamic> get({
    required String endpoint,
    Map<String, String>? queryParams,
  }) async {
    try {
      final uri = Uri.parse(ApiConfig.baseUrl + endpoint)
          .replace(queryParameters: queryParams);

      final response = await _client.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      throw Exception('Failed to load data: ${response.statusCode}');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
} 
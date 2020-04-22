import 'dart:convert';

import 'package:chiudiamo_il_cerchio/helpers/exceptions.dart';
import 'package:http/http.dart' as http;

import '../helpers/constants.dart';
import '../models/page.dart';

/// Retrieves blog pages exposed via REST API. This client provides partial
/// support and provides only access to a list of pages. Consider to refactor
/// it to include every HTTP verb.
class BlogAPI {
  http.Client httpClient = http.Client();

  /// Fetches `/pages/` endpoint and returns a list of pages.
  Future<List<Page>> fetch() async {
    final response =
        await this.httpClient.get('${Constants.APIEndpoint}/pages/index.json');
    if (response.statusCode != 200) {
      throw http.ClientException(
          'Client Exception (${response.statusCode}): ${response.body}');
    }

    // If the server doesn't send `encoding` header, Flutter decodes using
    // latin-1 instead of utf-8
    return parsePagesResponse(utf8.decode(response.bodyBytes));
  }
}

/// Parses a `Response` object for the `/pages/` endpoint.
///
/// Args:
///   body: the response body `String`
///
/// Returns:
///   A list of `Page` models.
List<Page> parsePagesResponse(String body) {
  try {
    Map<String, dynamic> response = json.decode(body);
    final items = response['output']['data']['items'] as List;
    return items.map((item) => Page.fromJson(item)).toList();
  } on NoSuchMethodError catch (e) {
    // Response has unexpected data
    throw DecodeException('API /pages/ has unexpected data');
  }
}

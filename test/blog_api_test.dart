import 'package:chiudiamo_il_cerchio/helpers/exceptions.dart';
import 'package:chiudiamo_il_cerchio/models/page.dart';
import 'package:chiudiamo_il_cerchio/services/blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fixtures.dart';

// Mocks
class MockClient extends Mock implements http.Client {}

void main() {
  /// Requires HTTP mocks
  group('Service: Blog', () {
    test('should return a list of pages after calling /pages/ API', () async {
      final BlogAPI api = BlogAPI();
      final mockClient = MockClient();
      api.httpClient = mockClient;
      when(mockClient.get('https://chiudiamo-il-cerchio.web.app/api/v0/pages/index.json'))
          .thenAnswer((_) async => http.Response(Fixtures.pagesResponse, 200));

      List<Page> pages = await api.fetch();
      expect(pages.length, 2);
    });

    test('should raise a ClientError exception if /pages/ API returns an error', () async {
      final BlogAPI api = BlogAPI();
      final mockClient = MockClient();
      api.httpClient = mockClient;
      when(mockClient.get('https://chiudiamo-il-cerchio.web.app/api/v0/pages/index.json'))
          .thenAnswer((_) async => http.Response(Fixtures.pagesResponseError, 500));

      expect(() async => await api.fetch(), throwsA(isA<http.ClientException>()));
    });
  });

  group('Service: Blog Helpers', () {
    test('should parse /pages/ response', () {
      List<Page> pages = parsePagesResponse(Fixtures.pagesResponse);
      expect(pages.length, 2);
      expect(pages[0].title, 'Chi siamo');
      expect(pages[1].title, 'Il Progetto');
    });

    test('should raise an exception if the response contains an error', () {
      expect(() => parsePagesResponse(Fixtures.pagesResponseError), throwsA(isA<DecodeException>()));
    });
  });
}

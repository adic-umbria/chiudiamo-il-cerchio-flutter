import 'package:chiudiamo_il_cerchio/resources/pages.dart';
import 'package:chiudiamo_il_cerchio/services/blog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mocks
class MockClient extends Mock implements BlogAPI {}

void main() {
  /// Requires API mocks
  group('Resources: Pages', () {
    test('should call BlogAPI.fetch() to retrieve `Page` list', () async {
      final pages = PagesRepository();
      final mockAPI = MockClient();
      pages.blogAPI = mockAPI;
      when(mockAPI.fetch()).thenAnswer((_) => Future.value(null));

      await pages.fetch();
      verify(mockAPI.fetch()).called(1);
    });
  });
}

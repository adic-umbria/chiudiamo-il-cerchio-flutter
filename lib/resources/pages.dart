import 'package:chiudiamo_il_cerchio/models/page.dart';
import 'package:chiudiamo_il_cerchio/services/blog.dart';

/// Abstraction that retrieves Pages for UI widgets. It uses
/// Repository Pattern to abstract from where pages are fetched.
///
/// In this implementation, only API calls are supported, but in a
/// later functionality, this method should implement even local storage.
class PagesRepository {
  BlogAPI blogAPI = BlogAPI();

  /// Calls Blog APIs to retrieve all pages
  Future<List<Page>> fetch() => blogAPI.fetch();
}

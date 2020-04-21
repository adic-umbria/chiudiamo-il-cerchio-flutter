import 'dart:convert';

import 'package:chiudiamo_il_cerchio/models/page.dart';
import 'package:flutter_test/flutter_test.dart';

import './fixtures.dart';

void main() {
  group('Model: Page', () {
    test('fromJSON should parse the response correctly', () {
      Page page = Page.fromJson(Fixtures.pageCorrectJSON);
      expect(page.created, '2020-04-21T12:00:00+02:00');
      expect(page.description, 'Something to show');
      expect(page.draft, false);
      expect(page.permalink, 'https://example.com/blog/chi-siamo/');
      expect(page.relpermalink, '/blog/chi-siamo/');
      expect(page.title, 'Chi siamo');
      expect(page.type, 'page');
      expect(page.updated, '2020-04-21T12:00:00+02:00');
      expect(page.weight, 0);
    });

    test('fromJSON should parse correctly a partial response', () {
      Page page = Page.fromJson(Fixtures.pageBadJSON);
      expect(page.title, 'Chi siamo');
      expect(page.description, 'Something to show');
      expect(page.created, null);
      expect(page.draft, null);
      expect(page.permalink, null);
      expect(page.relpermalink, null);
      expect(page.type, null);
      expect(page.updated, null);
      expect(page.weight, null);
    });

    test('toJSON should return a JSON object', () {
      String pageJSON = json.encode(Fixtures.page.toJson());
      expect(pageJSON,
          '{"created":"2020-04-21T12:00:00+02:00","description":"Something to show","draft":false,"permalink":"https://example.com/blog/chi-siamo/","relpermalink":"/blog/chi-siamo/","title":"Chi siamo","type":"page","updated":"2020-04-21T12:00:00+02:00","weight":0}');
    });

    test('stringify should be available', () {
      expect(Fixtures.page.toString(), 'Page(page, Chi siamo)');
    });
  });
}

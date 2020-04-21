import 'dart:convert';

import 'package:chiudiamo_il_cerchio/models/page.dart';

class Fixtures {
  static final Map<String, dynamic> pageCorrectJSON = json.decode('''
    {
      "created": "2020-04-21T12:00:00+02:00",
      "description": "Something to show",
      "draft": false,
      "outputs": [
        {
          "type": "html",
          "url": "https://example.com/blog/chi-siamo/"
        }
      ],
      "permalink": "https://example.com/blog/chi-siamo/",
      "relpermalink": "/blog/chi-siamo/",
      "title": "Chi siamo",
      "type": "page",
      "updated": "2020-04-21T12:00:00+02:00",
      "weight": 0
    }    
  ''');
  static final Map<String, dynamic> pageBadJSON = json.decode('''
    {
      "description": "Something to show",
      "title": "Chi siamo"
    }    
  ''');
  static final String pagesResponse = '''
    {
      "output": {
        "data": {
          "count": 2,
          "items": [
            {
              "created": "2020-04-21T12:00:00+02:00",
              "description": "Something to show",
              "draft": false,
              "outputs": [
                {
                  "type": "html",
                  "url": "https://example.com/blog/chi-siamo/"
                }
              ],
              "permalink": "https://example.com/blog/chi-siamo/",
              "relpermalink": "/blog/chi-siamo/",
              "title": "Chi siamo",
              "type": "page",
              "updated": "2020-04-21T12:00:00+02:00",
              "weight": 0
            },
            {
              "created": "2020-04-21T12:00:00+02:00",
              "description": "Something to show",
              "draft": false,
              "outputs": [
                {
                  "type": "html",
                  "url": "https://example.com/micro/il-progetto/"
                }
              ],
              "permalink": "https://example.com/micro/il-progetto/",
              "relpermalink": "/micro/il-progetto/",
              "title": "Il Progetto",
              "type": "page",
              "updated": "2020-04-21T12:00:00+02:00",
              "weight": 0
            }
          ],
          "taxonomy": "tag",
          "term": "in-app"
        }
      }
    }
  ''';
  static final String pagesResponseError = '''
    {
      "status": "error",
      "code": 500
    }
  ''';
  static final Page page = Page(
    created: '2020-04-21T12:00:00+02:00',
    description: 'Something to show',
    draft: false,
    permalink: 'https://example.com/blog/chi-siamo/',
    relpermalink: '/blog/chi-siamo/',
    title: 'Chi siamo',
    type: 'page',
    updated: '2020-04-21T12:00:00+02:00',
    weight: 0,
  );
}

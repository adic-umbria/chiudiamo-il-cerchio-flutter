import 'package:flutter/material.dart';

import '../models/page.dart';
import '../resources/pages.dart';
import '../screens/viewer.dart';
import 'page_item.dart';

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  // Data source
  final PagesRepository pagesRepository = PagesRepository();
  Future<List<Page>> pages;

  @override
  void initState() {
    super.initState();
    pages = pagesRepository.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Page>>(
        future: pages,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Handles retries in case of failures
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Caricamento articoli fallito',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    onPressed: () {
                      // Re-initialize the state
                      setState(() {
                        pages = pagesRepository.fetch();
                      });
                    },
                    child: Text(
                      'Riprova',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData) {
            // Show a loading spinner
            return Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            // Populate `PageList` with data
            return SingleChildScrollView(
              child: Column(
                children: _buildLines(context, snapshot.data),
              ),
            );
          }
        },
      ),
    );
  }
}

List<Widget> _buildLines(BuildContext context, List<Page> pages) {
  List<Widget> lines = [];
  for (var i = 0; i < pages.length; i++) {
    lines.add(PageItem(
      index: i,
      page: pages[i],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageViewer(url: pages[i].permalink),
          ),
        );
      },
    ));
    lines.add(Divider(
      thickness: 1,
      endIndent: 20,
      indent: 20,
    ));
  }

  return lines;
}

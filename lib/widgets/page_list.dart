import 'package:flutter/material.dart';

import '../models/page.dart';
import '../resources/pages.dart';
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
          // By default, show a loading spinner
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            // TODO: handle the reload in case of failure
            return Text('Load failed: $snapshot.error');
          }
          return SingleChildScrollView(
            child: Column(
              children: _buildLines(snapshot.data),
            ),
          );
        },
      ),
    );
  }
}

List<Widget> _buildLines(List<Page> pages) {
  List<Widget> lines = [];
  for (var i = 0; i < pages.length; i++) {
    lines.add(PageItem(
      index: i,
      page: pages[i],
    ));
    lines.add(Divider(
      thickness: 1,
      endIndent: 20,
      indent: 20,
    ));
  }

  return lines;
}

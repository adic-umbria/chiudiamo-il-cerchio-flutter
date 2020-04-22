import 'package:flutter/material.dart';

import '../models/page.dart';
import 'page_item.dart';

class PageList extends StatelessWidget {
  final List<Page> pages;

  PageList({@required this.pages});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildLines(pages),
        ),
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

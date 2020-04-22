import 'package:flutter/material.dart';

import './page_item.dart';
import '../models/page.dart';

class PageList extends StatelessWidget {
  final double width;
  final List<Page> pages;

  PageList({
    @required this.width,
    @required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildLine(pages, width),
        ),
      ),
    );
  }
}

List<Widget> _buildLine(List<Page> pages, double width) {
  List<Widget> lines = [];
  for (var i = 0; i < pages.length; i++) {
    lines.add(PageItem(
      width: width,
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

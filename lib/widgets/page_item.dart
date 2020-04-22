import 'package:flutter/material.dart';

import '../models/page.dart';
import '../theme/colors.dart';
import 'components/patterns.dart';

class PageItem extends StatelessWidget {
  final int index;
  final Page page;
  final double width;

  PageItem({
    @required this.page,
    @required this.index,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Compute a random pattern
    // TODO: provide a thumbnail and compute a pattern only if empty
    List values = createPattern(index);
    Color primaryColor = values[0];
    Widget pattern = values[1];

    return Container(
        height: 170,
        width: width - 20,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: .7,
              child: CardPlaceholder(
                primaryColor: primaryColor,
                pattern: pattern,
                width: width,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Text(page.title,
                            style: TextStyle(
                              color: ThemeColor.darkGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  page.description,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 15),
              ],
            ))
          ],
        ));
  }
}

class CardPlaceholder extends StatelessWidget {
  final Color primaryColor;
  final Widget pattern;
  final double width;

  CardPlaceholder({
    @required this.primaryColor,
    @required this.pattern,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        width: width * .34,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: Color(0x12000000))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: pattern,
        ));
  }
}

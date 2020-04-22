import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'components/background_circle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  static const double widgetHeight = 120.0;

  CustomAppBar({@required this.title});

  @override
  Size get preferredSize => Size.fromHeight(widgetHeight);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return ClipRRect(
      child: Container(
          height: widgetHeight,
          width: width,
          decoration: BoxDecoration(
            color: ThemeColor.lightGreen,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 10,
                  right: -120,
                  child: BackgroundCircle(
                    height: 300,
                    color: ThemeColor.green,
                  )),
              Positioned(
                  top: -60,
                  left: -65,
                  child: BackgroundCircle(
                    height: width * .5,
                    color: ThemeColor.darkGreen,
                  )),
              Positioned(
                  top: -230,
                  right: -30,
                  child: BackgroundCircle(
                    height: width * .7,
                    color: Colors.transparent,
                    borderColor: Colors.white38,
                  )),
              Positioned(
                  top: 50,
                  left: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ))),
            ],
          )),
    );
  }
}

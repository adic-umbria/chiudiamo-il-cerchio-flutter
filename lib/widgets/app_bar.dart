import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'components/background_circle.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double width;

  CustomAppBar({@required this.title, @required this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 120,
          width: width,
          decoration: BoxDecoration(
            color: ThemeColor.orange,
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
                    color: ThemeColor.lightOrange,
                  )),
              Positioned(
                  top: -60,
                  left: -65,
                  child: BackgroundCircle(
                    height: width * .5,
                    color: ThemeColor.darkOrange,
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
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ))),
            ],
          )),
    );
  }
}

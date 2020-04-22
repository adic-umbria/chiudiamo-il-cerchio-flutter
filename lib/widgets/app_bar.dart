import 'package:chiudiamo_il_cerchio/theme/color/light_color.dart';
import 'package:flutter/material.dart';

import './background_circle.dart';

class CustomAppBar extends StatelessWidget {
  // MediaQuery.of(context).size.width
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
            color: LightColor.orange,
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
                    color: LightColor.lightOrange2,
                  )),
              Positioned(
                  top: -60,
                  left: -65,
                  child: BackgroundCircle(
                    height: width * .5,
                    color: LightColor.darkOrange,
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

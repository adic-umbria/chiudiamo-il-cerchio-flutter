import 'package:flutter/material.dart';

import '../../theme/color/light_color.dart';
import 'background_circle.dart';
import 'clipper.dart';

/// Returns a pattern for a `CardPlaceholder` that contains
/// a `colorCode` and a `Stack` instance.
///
/// Note: Dart doesn't support multiple returns, or `tuple` with
/// destructuring syntactic sugar: https://github.com/dart-lang/language/issues/68
/// so this is why I return a `List` with a code color and a pattern.
///
/// Args:
///   index: the index the item has in the `ListView`; used to do round-robin
///          patterns.
///
/// Returns:
///   An ordered `List` with the following position: [color, widget].
List createPattern(int index) {
  switch (index % 3) {
    case 0:
      return [LightColor.seeBlue, _patternA()];
    case 1:
      return [LightColor.darkOrange, _patternB()];
    case 2:
      return [LightColor.lightOrange2, _patternC()];
    default:
      // Empty pattern
      return [Colors.black, Container()];
  }
}

Widget _patternA() {
  return Stack(
    children: <Widget>[
      Positioned(
        top: -110,
        left: -85,
        child: CircleAvatar(
          radius: 100,
          backgroundColor: LightColor.darkseeBlue,
        ),
      ),
      _decorationCircle(LightColor.yellow, 40, 20),
      Positioned(
        top: -30,
        right: -10,
        child: BackgroundCircle(
          height: 80,
          color: Colors.transparent,
          borderColor: Colors.white,
        ),
      ),
      Positioned(
        top: 110,
        right: -50,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: LightColor.darkseeBlue,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: LightColor.seeBlue,
          ),
        ),
      ),
    ],
  );
}

Widget _patternB() {
  return Stack(
    children: <Widget>[
      Positioned(
        top: -65,
        left: -65,
        child: CircleAvatar(
          radius: 70,
          backgroundColor: LightColor.lightOrange2,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: LightColor.darkOrange,
          ),
        ),
      ),
      Positioned(
          bottom: -35,
          right: -40,
          child: CircleAvatar(
            backgroundColor: LightColor.yellow,
            radius: 40,
          )),
      Positioned(
        top: 50,
        left: -40,
        child: BackgroundCircle(
          height: 70,
          color: Colors.transparent,
          borderColor: Colors.white,
        ),
      ),
    ],
  );
}

Widget _patternC() {
  return Stack(
    children: <Widget>[
      Positioned(
        bottom: -65,
        left: -35,
        child: CircleAvatar(
          radius: 70,
          backgroundColor: Color(0xfffeeaea),
        ),
      ),
      Positioned(
          bottom: -30,
          right: -25,
          child: ClipRect(
              clipper: Clipper(),
              child: CircleAvatar(
                backgroundColor: LightColor.yellow,
                radius: 40,
              ))),
      _decorationCircle(Colors.yellow, 35, 70),
    ],
  );
}

Positioned _decorationCircle(Color primaryColor, double top, double left,
    {double radius = 10}) {
  return Positioned(
      top: top,
      left: left,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: primaryColor.withAlpha(255),
      ));
}

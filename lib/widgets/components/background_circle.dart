import 'package:flutter/material.dart';

class BackgroundCircle extends StatelessWidget {
  final double height;
  final double borderWidth;
  final Color color;
  final Color borderColor;

  BackgroundCircle({
    @required this.height,
    @required this.color,
    this.borderColor = Colors.transparent,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }
}

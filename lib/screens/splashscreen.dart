import 'dart:async';

import 'package:flutter/material.dart';

import '../helpers/constants.dart';

/// First screen used in the app, it provides a SplashScreen
/// that lasts few seconds. To change the duration, update the constant
/// available in `Constants.SplashDuration`.
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigateTo() {
    Navigator.of(context).pushReplacementNamed('/Home');
  }

  Future startTime() async => Timer(
        Duration(seconds: Constants.SplashDuration),
        navigateTo,
      );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: new Image.asset('assets/splashscreen.png'),
      ),
    );
  }
}

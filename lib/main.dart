import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/splashscreen.dart';

void main() => runApp(AppMain());

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chiudiamo il cerchio!',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => HomeScreen()
      },
    );
  }
}

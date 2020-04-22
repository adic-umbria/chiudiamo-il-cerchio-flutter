import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(AppMain());

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chiudiamo il cerchio!',
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

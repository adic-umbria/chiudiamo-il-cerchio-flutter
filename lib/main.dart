import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'widgets/app_bar.dart';

void main() => runApp(AppMain());

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chiudiamo il cerchio!',
      home: Scaffold(
        appBar: CustomAppBar(title: 'Chiudiamo il cerchio!'),
        body: HomeScreen(),
      ),
    );
  }
}

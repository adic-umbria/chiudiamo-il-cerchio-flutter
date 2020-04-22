import 'package:flutter/material.dart';

import '../widgets/page_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          PageList(),
        ],
      ),
    );
  }
}

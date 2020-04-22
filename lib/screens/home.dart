import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/page_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Chiudiamo il cerchio!'),
      body: PageList(),
    );
  }
}

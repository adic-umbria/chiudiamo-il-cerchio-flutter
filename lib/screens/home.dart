import 'package:flutter/material.dart';

import '../helpers/pages_fixtures.dart';
import '../widgets/app_bar.dart';
import '../widgets/page_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            CustomAppBar(
              title: "Chiudiamo il Cerchio!",
            ),
            SizedBox(height: 20),
            PageList(
              pages: CourseList.lists,
            ),
          ],
        ),
      ),
    );
  }
}

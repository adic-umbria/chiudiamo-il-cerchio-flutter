import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/app_bar.dart';

class PageViewer extends StatelessWidget {
  final String url;

  PageViewer({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Chiudiamo il cerchio!'),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}

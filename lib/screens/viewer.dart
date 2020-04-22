import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        navigationDelegate: (NavigationRequest request) async {
          // Open an external browser to continue the navigation
          if (await canLaunch(request.url)) {
            await launch(request.url);
          } else {
            throw Exception('Could not open: $url');
          }

          // Never open a link on this WebView
          return NavigationDecision.prevent;
        },
      ),
    );
  }
}

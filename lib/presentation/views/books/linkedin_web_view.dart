import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LinkedInWebView extends StatelessWidget {
  const LinkedInWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ramón de Jesus Ortega'),
      ),
      body: const WebView(
        initialUrl: 'https://linktr.ee/uxorialcolt',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

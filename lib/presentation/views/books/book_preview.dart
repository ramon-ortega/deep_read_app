import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookPreview extends StatelessWidget {
  final String previewLink;

  const BookPreview({Key? key, required this.previewLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista Previa'),
      ),
      body: WebView(
        initialUrl: previewLink,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

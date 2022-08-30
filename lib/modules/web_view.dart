import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  WebViewScreen(this.url, {Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var linear = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            onPageStarted: (value) {
              setState(() {
                linear = 0;
              });
            },
            onProgress: (value) {
              setState(() {
                linear = value;
              });
            },
            onPageFinished: (value) {
              setState(() {
                linear = 100;
              });
            },
          ),
          if (linear < 100)
            LinearProgressIndicator(
              value: linear / 100,
              minHeight: 6,
            ),
        ],
      ),
    );
  }
}

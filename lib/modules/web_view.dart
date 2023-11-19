import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:new_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  WebViewScreen(this.url, {Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  double linear = 0;
  late InAppWebViewController webView;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).NewsApp),
      ),
      body: Stack(
        children: [
          if (!Platform.isWindows)
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
              onWebViewCreated: (InAppWebViewController cont) {
                webView = cont;
              },
              onProgressChanged: (InAppWebViewController cont, int progress) {
                setState(() {
                  linear = progress / 100;
                });
              },
            )
          else
            Center(
              child: TextButton(
                child: Text('${widget.url}'),
                onPressed: () => _launchUrl(widget.url),
              ),
            ),
          if (linear < 1.0 && !Platform.isWindows)
            LinearProgressIndicator(
              value: linear,
              minHeight: 6,
            ),
        ],
      ),
    );
  }
}

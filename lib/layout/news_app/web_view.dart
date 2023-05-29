import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScrean extends StatelessWidget {
  //const WebView({Key? key}) : super(key: key);
 final String url;
 var webViewController = WebViewController();
 WebViewScrean(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
           title: const Text(
           'News'
       ),
           //backgroundColor: Colors.grey,
           foregroundColor: Colors.black),
      body: WebViewWidget(
        controller: webViewController..loadRequest(Uri.parse(url)) ,
      ),
    );
  }
}

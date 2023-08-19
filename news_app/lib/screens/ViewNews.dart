import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ViewNews extends StatelessWidget {
  final newsUrl;

  const ViewNews({Key? key, this.newsUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(centerTitle: true, title: const Text("News")),
      body: WebView(initialUrl: newsUrl, javascriptMode: JavascriptMode.unrestricted),
    );
  }
}

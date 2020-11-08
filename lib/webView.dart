import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class webview extends StatefulWidget {
  final pageTitle;
  final pageUrl;
  webview({this.pageTitle, this.pageUrl, });
  @override
  _webviewState createState() => _webviewState();
}

class _webviewState extends State<webview> {



  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.pageUrl,
      appBar: AppBar(
          title: Text(widget.pageTitle,style: TextStyle(color: Colors.white),),
          centerTitle: true,
          elevation: 10,
        backgroundColor: Color(0xff4E008A),

      ),
      withJavascript: true,
      withZoom: true,

    );
  }
}

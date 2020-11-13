import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'HomePage.dart';

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
        backgroundColor: Color(0xff4E008A),
        title:Text(widget.pageTitle,style: TextStyle(color: Colors.white,fontSize:20),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,
          onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

          } ,),

        actions: [
          Image.asset("assets/logo.png",color: Colors.white,),
          Builder(
                builder: (context) => FlatButton(
                  child :  Icon(Icons.list,color: Colors.white,size: 30,),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
        ],

      ),
      withJavascript: true,
      withZoom: true,

    );
  }
}

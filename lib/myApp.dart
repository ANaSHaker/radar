import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pubg/webView.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Chat.dart';
import 'HomePage.dart';

String email;
_launchWhatsApp() async {
  String message = 'السلام عليكم';
  var whatsappUrl = "whatsapp://send?phone=966509977750&text=$message";
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class myApp extends StatefulWidget {


  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: BottomAppBar(
        elevation: 20.0,


        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            FlatButton(
                child:  Image.asset("assets/1.png",width:55,),
                onPressed: (){
                  launchURL("https://storpubg.com/category/GZaNw");

                }
            ),
            FlatButton(
                child:Image.asset("assets/2.png",width:60,),
                onPressed: (){
                  launchURL("https://storpubg.com/category/dEyyP");

                }
            ),
            FlatButton(
                child:Image.asset("assets/3.png",width:45,),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

                }
            ),

          ],
        ),
      ),
    );
  }
}

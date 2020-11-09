import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String email;

class myApp extends StatefulWidget {


  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff4E008A),
      title:Text('Logged in as $email ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:24),),
      centerTitle: true,
      leading:             Image.asset("assets/logo.png",color: Colors.white,),

      actions: [
       Builder(
                builder: (context) => FlatButton(
                  child :  Image.asset("assets/list.png",),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
      ],

    );
  }
}

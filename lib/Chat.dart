import 'package:flutter/material.dart';

import 'package:flutter_tawk/flutter_tawk.dart';

import 'HomePage.dart';
import 'myDrawer.dart';


class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4E008A),
        title:Text("الدعم الفني",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:24),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,
          onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

          } ,),

        actions: [
          Image.asset("assets/logo.png",color: Colors.white,),
          Builder(
            builder: (context) => FlatButton(
              child :  Image.asset("assets/list.png",),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],

      ),
      endDrawer:myDrawer() ,

      body: Tawk(
          directChatLink: 'https://tawk.to/chat/5fa6c15d8e1c140c2abbbadb/default?fbclid=IwAR3nilGY0VK0FoOpkVd3cYh_ias765fi3Wjv4dC8avnMzK9kRE0_JnccZvo',
          visitor: TawkVisitor(
            name: '',
            email: '',
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder:Center(
            child: CircularProgressIndicator(),
          ),
        ),

    );
  }
}
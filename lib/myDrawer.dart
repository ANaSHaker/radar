import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pubg/webView.dart';
import 'package:share/share.dart';

import 'Chat.dart';
import 'HomePage.dart';
import 'Login.dart';
import 'news/screens/home.dart';

class myDrawer extends StatefulWidget {
  @override
  _myDrawerState createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset("assets/logo.png",color: Colors.white,height: 250,width: 300,),
            decoration: BoxDecoration(
              color:  Color(0xff4E008A),
            ),
          ),
          ListTile(
            title: Text('الرئيسية',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Icon(Icons.home,color: Color(0xff4E008A)),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

            },
          ),
          ListTile(
            title: Text('الاخبار',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Image.asset("assets/news.png",color: Color(0xff4E008A),width: 30,),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeNews()));

            },
          ),
          ListTile(
            title: Text('موقعنا',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Image.asset("assets/websiteDrawer.png",color: Color(0xff4E008A)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>   webview(
                pageTitle: "STOR PUBG",
                pageUrl: "https://storpubg.com/",
              )));
            },
          ),
          ListTile(
            title: Text('تواصل معنا',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Icon(Icons.people,color: Color(0xff4E008A)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>   webview(
                pageTitle: "رادار شارب شوتر",
                pageUrl: "https://mobile.facebook.com/ali.vep.96?_rdc=1&_rdr",
              )));
            },
          ),
          ListTile(
            title: Text('الدعم الفني',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Image.asset("assets/SettingDrawer.png",color: Color(0xff4E008A)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>chat()));

            },
          ),

          Divider(color: Colors.grey,),
          ListTile(
            title: Text('ألتعليمات',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Icon(Icons.info,color: Colors.grey),
            onTap: () {},
          ),
          ListTile(
            title: Text('سياسة الخصوصية',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Icon(Icons.privacy_tip,color: Colors.grey),
            onTap: () {},
          ),
          ListTile(
            title: Text('مشاركة ',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Icon(Icons.share,color: Colors.grey),
              onTap:()=>Share.share("https://storpubg.com/ حمل الان تطبيق رادار ببجي واسمتمتع بمتابعة كل الاخبار والشروحات الحصريه ")
          ),
          ListTile(
            title: Text('تسجيل الخروج',style: TextStyle(color: Color(0xff4E008A),fontWeight: FontWeight.bold,fontSize: 17),),
            trailing: Icon(Icons.exit_to_app ,color: Colors.grey),
            onTap: ()  async {
          await _firebaseAuth.signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));

            }
          ),

        ],
      ),
    ) ;
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:launch_review/launch_review.dart';

import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'HomePage.dart';
import 'myDrawer.dart';



class CLEAR extends StatefulWidget {
  @override
  _CLEARState createState() => _CLEARState();
}

class _CLEARState extends State<CLEAR> {

  @override
  void initState() {
    super.initState();
  }


  @override
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff4E008A),
          title:Text("VPN VIP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:24),),
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

      body: Container(
          color: Color(0xffCBBFD5),
          child: Center(
            child : Container(
              height: 300,
              width: 300,
              child: Center(child: Text("START NOW",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),)),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[Colors.pinkAccent,Color(0xff4E008A)], ),//RadialGradient(colors: [Color(0xffCBBFD5),Color(0xff4E008A)],),
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(color: Colors.white,width: 8)
              ),
            ),
          )
      ),
    );
  }
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  Widget lanBox(Function lang, String lanName){
    return  InkWell(

      onTap: lang,
      child: Material(child: Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 8,right: 18,left: 18),
        child: Text(lanName,
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
      ),
        elevation: 10,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black)
        ),),

    );
  }
}

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:fab_circular_menu/fab_circular_menu.dart';

import 'myApp.dart';
import 'myDrawer.dart';



class VPN extends StatefulWidget {
  @override
  _VPNState createState() => _VPNState();
}

class _VPNState extends State<VPN> {

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
        title:Text("VPN VIP",style: TextStyle(color: Colors.white,fontSize:20),),
        centerTitle: true,
        leading:             Image.asset("assets/logo.png",color: Colors.white,),

        actions: [
          Builder(
                builder: (context) => FlatButton(
                  child :  Icon(Icons.list,color: Colors.white,size: 30,),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
        ],

      ),
      bottomNavigationBar: myApp(),
      endDrawer:myDrawer() ,

      body: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Color(0xffFF375E),Color(0xff4E008A),])
        ),      child: Center(
            child : Container(
              height: 300,
              width: 300,
              child: Center(child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("START NOW",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),),
                    Text("قريبا",style: TextStyle(color: Colors.white,fontSize: 18),),

                  ]
              )),
              decoration: BoxDecoration(
                  gradient:  LinearGradient(colors:[Colors.pinkAccent,Color(0xff4E008A)], ),//RadialGradient(colors: [Color(0xffCBBFD5),Color(0xff4E008A)],),
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
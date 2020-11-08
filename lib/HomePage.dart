
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pubg/ID.dart';
import 'package:pubg/webView.dart';

import 'Aimbot/screens/home.dart';
import 'Chat.dart';
import 'Profile.dart';
import 'Videos/screens/home.dart';
import 'Login.dart';
import 'clearData.dart';
import 'myDrawer.dart';
import 'news/screens/home.dart';
import 'vpn.dart';

class HomePage extends   StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () {
        return AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          body: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                "هل تود اغلاق التطبيق",
                textAlign: TextAlign.center,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  color: Colors.green,
                  child: Text("نعم"),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                FlatButton(
                  color: Colors.red,
                  child: Text("لا"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ).show();
      },

      child: Scaffold(
          backgroundColor:  Color(0xffCBBFD5),
          appBar: AppBar(
            backgroundColor: Color(0xff4E008A),
            title:Text("الرئيسية",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:24),),
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

          ),
          /*bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: BottomAppBar(
            elevation: 20.0,


            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                   child: Image.asset("assets/websiteIcon.png",),
                    onPressed: (){
                    }
                ),
                FlatButton(
                    child: Image.asset("assets/contactIcon.png",),
                    onPressed: (){
                    }
                ),
                FlatButton(
                    child: Image.asset("assets/supportIcon.png",),
                    onPressed: (){
                    }
                ),
                FlatButton(
                    child: Image.asset("assets/homeIcon.png",),
                    onPressed: (){
                    }
                ),

              ],
            ),
          ),
        ),*/
          endDrawer:myDrawer() ,

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeNews()));

                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/news.png"),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xff4E008A),width: 8)
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeAimbot()));
                    },
                    child: Container(
                      child: Image.asset("assets/input.png"),

                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xff4E008A),width: 8)
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  InkWell(
                    onTap: (){        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AboutPage()));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/id.png"),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xff4E008A),width: 8)
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeVideo()));

                    },
                    child: Container(
                      child: Image.asset("assets/video.png"),

                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xff4E008A),width: 8)
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>chat()));

                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/chat.png"),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xff4E008A),width: 8)
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>   webview(
                        pageTitle: "STOR PUBG",
                        pageUrl: "https://storpubg.com/",
                      )));
                    },
                    child: Container(
                      child: Image.asset("assets/store.png",),

                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xff4E008A),width: 8)
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VPN()));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Center(child: Text(" VPN \n VIP",style: TextStyle(color: Color(0xff4E008A),fontSize: 26,fontWeight: FontWeight.bold),)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xff4E008A),width: 8)
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CLEAR()));
                    },                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/clear.png",),
                    ),

                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xff4E008A),width: 8)
                      ),
                    ),
                  )
                ],
              ),

            ],
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
}

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {

  @override
  Widget build(BuildContext context) {
    Items item1 = new Items(
        title: "Ninja News",
        press: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeNews()));

        },


        img: "assets/news.png");

    Items item2 = new Items(
      title: "Aimbot",
      press: (){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeVideo()));

      },

      img: "assets/input.png",
    );

    Items item3 = new Items(
      title: "Clear Data",
      press: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AboutPage()));

      },

      img: "assets/status.png",
    );

    Items item4 = new Items(
      title: "Live Support",
      press: (){},

      img: "assets/chat.png",
    );

    Items item5 = new Items(
      title: "Videos",
      press: (){},

      img: "assets/video.png",
    );

    Items item6 = new Items(
      title: "STOR PUBG",
      press: (){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>   webview(
          pageTitle: "STOR PUBG",
          pageUrl: "https://storpubg.com/",
        )));

      },

      img: "assets/store.png",
    );

    var color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[800]: Colors.white;
    List<Items> myList = [item1, item2, item3, item4, item5, item6];

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              focusColor: Colors.green,
              hoverColor: Colors.green,
              splashColor: Colors.green,
              highlightColor: Colors.green,
              onTap: data.press,
              child: Container(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      data.img,
                      width: 135,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /* Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),*/
                    SizedBox(
                      height: 8,
                    ),

                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Function press;
  Items({this.title, this.img, this.press, });
}



/*
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';

import 'ID.dart';
import 'Login.dart';
import 'Video/views/home.dart';
import 'webView.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> images = [
    "assets/news.png",
    "assets/input.png",
    "assets/status.png",
    "assets/video.png",
    "assets/chat.png",
    "assets/about.png",


  ];

  Widget customcard(String langname, String image,Function press){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: press,
        child: Material(
          color:Theme.of(context).brightness == Brightness.dark ? Colors.black54 :  Color(0xffD4AF37),
          elevation: 20.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(

            padding: EdgeInsets.all(10),
            height: 180,
            width: 180,
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    height: 110.0,
                    width: 110.0,
                    child: ClipOval(
                      child: Image(image: AssetImage(image,),fit: BoxFit.contain,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top :10.0),
                  child: Center(
                    child: Text(
                      langname,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Quando",
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,

                    ),

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("رادار ببجي"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){},

          highlightColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[900] :  Colors.orange,
          splashColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[900] :  Colors.orange,
          color:Theme.of(context).brightness == Brightness.dark ? Colors.grey[900] :  Colors.orange,
        ),
        actions: [
          IconButton(
            onPressed: ()async{
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()))
              );
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],


      ),


        body: GridView.count(crossAxisCount: 2,
          padding: EdgeInsets.only(top: 50),
          children: <Widget>[
            customcard("اخبار اونلاين", images[0],(){Navigator.push(context, MaterialPageRoute(builder: (context)=>   webview(
              pageTitle: "اخبار اونلاين",
              pageUrl: "https://cheatninja.com/status/",
            )));


            }  ),
            customcard("اعدادات الامبوت", images[1],(){
            } ),


            customcard("حالة الالعاب", images[2],(){Navigator.push(context, MaterialPageRoute(builder: (context)=>   webview(
              pageTitle: "حالة الالعاب",
              pageUrl: "https://cheatninja.com/status/",
            )));

            }  ),
            customcard("شروحات مهمة", images[3],(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Viedo()));

            } ),


            customcard("شات تواصل", images[4
            ],(){

            } ),
            customcard("عن التطبيق", images[5],(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));

            } ),




          ],)

    );
  }

}
*/

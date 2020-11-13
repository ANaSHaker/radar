import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage.dart';
import 'Login.dart';




class Splash extends StatefulWidget{
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>  with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<Offset>(begin: Offset(-4, 0), end: Offset(0, 0)).animate(
        _animationController);

    _animationController.forward().whenComplete(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Function hp = Screen(MediaQuery.of(context).size).hp;

    return Scaffold(
      backgroundColor: Color(0xff4E008A),

      body:  SafeArea(
          child: SlideTransition(
            position: _animation,
            child: Center(
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/white.png",height: 176,color: Colors.white,),
                      Text("رادار ببجي",style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                      ),
                      SizedBox(height: hp(1.5)),

                      Text("storpubg.com",style:TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                    ]
                )
            ),
          )
      ),
    );
  }
}
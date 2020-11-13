import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage.dart';
import 'myApp.dart';


// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      backgroundColor: Color(0xff4E008A),
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(hp(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[


                      SizedBox(height: hp(9)),

                      Image.asset("assets/header.png",height: 176,),
                      /*Text("رادار ببجي",style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                      ),
                      SizedBox(height: hp(1.5)),

                      Text("storpubg.com",style:TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),*/

                      SizedBox(height: hp(7)),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:24.0),
                              child: Text("Email",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),textAlign: TextAlign.left,),
                            ),
                            SizedBox(height: hp(2)),

                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),

                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.email,color: Color(0xff4E008A)),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),

                                ),

                              ),

                              validator: (input) {
                                if (input.isEmpty) {
                                  return "Please type an email";
                                }
                              },
                              onSaved: (input) => _email = input,
                            ),
                            SizedBox(
                              height: hp(5),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:24.0),
                              child: Text("Password",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),textAlign: TextAlign.left,),
                            ),
                            SizedBox(height: hp(2)),

                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.lock,color: Color(0xff4E008A),
                                  ),
                                 suffixIcon: IconButton(icon: Icon(_obscureText == true ? Icons.visibility : Icons.visibility_off),
                                 onPressed: _toggle,),

                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(100.0),
                                   borderSide: BorderSide(
                                     color: Colors.white,
                                   ),

                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(100.0),
                                   borderSide: BorderSide(
                                     color: Colors.white,
                                     width: 2.0,
                                   ),
                                 ),
                                   labelStyle:TextStyle(color: Colors.black),
                                   ),
                              validator: (input) {
                                if (input.length < 8) {
                                  return 'Password too short';
                                }
                              },
                              onSaved: (input) {
                                _password = input;
                              }
                            ),

                            SizedBox(
                              height: hp(10),
                            ),
                            Center(
                              child: Card(
                                elevation: 20,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                child: Container(

                                  color: Colors.transparent,
                                  width: 180,
                                  height: hp(7),
                                  child: FlatButton(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                    ),
                                    onPressed: access,
                                    color: Colors.white,
                                    child: Text(
                                      "LOG IN",
                                      style: TextStyle(
                                          color: Color(0xff4E008A), fontSize: 20,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // Container
    );
  }

  Future<void> access() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
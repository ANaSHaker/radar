import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Login.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email, _name, _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(String email, String password) async {
    FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password)) as FirebaseUser;
    return user.uid;
  }

  Future<void> saveUserOnDb(String email, String uid) async {
    Firestore.instance.runTransaction((Transaction transaction) async {
      DocumentReference reference =
      Firestore.instance.collection('users').document(uid);
      await reference.setData({
        "Full Name": _name,
        "Email ID": _email,
        "create_date": DateTime.now()
      }).catchError((e) {
        print(e);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: hp(7),
                      ),
                      Text(
                        "Lets get",
                        style: (TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey)),
                      ),
                      Text(
                        "you on board",
                        style: (TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey)),
                      ),
                      SizedBox(height: hp(7)),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration:
                               InputDecoration(hintText: "Full Name", hintStyle: TextStyle(color: Colors.grey),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(25.0),
                                   borderSide: BorderSide(
                                     color: Colors.blue,
                                   ),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(25.0),
                                   borderSide: BorderSide(
                                     color: Colors.red,
                                     width: 2.0,
                                   ),
                                 ),

                               ),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return "Please enter full name";
                                }
                              },
                              onSaved: (input) => _name = input,
                            ),
                            SizedBox(
                              height: hp(2),
                            ),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration:
                               InputDecoration(hintText: "Email", hintStyle: TextStyle(color: Colors.grey),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(25.0),
                                   borderSide: BorderSide(
                                     color: Colors.blue,
                                   ),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(25.0),
                                   borderSide: BorderSide(
                                     color: Colors.red,
                                     width: 2.0,
                                   ),
                                 ),),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return "Please type an email";
                                }
                              },
                              onSaved: (input) => _email = input,
                            ),
                            SizedBox(
                              height: hp(2),
                            ),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              obscureText: true,
                              decoration:
                               InputDecoration(hintText: "Password", hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),),
                              validator: (input) {
                                if (input.length < 8) {
                                  return 'Password too short';
                                }
                              },
                              onSaved: (input) => _password = input,
                            ),
                            SizedBox(
                              height: hp(3),
                            ),
                            SizedBox(
                              height: hp(3),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width,
                              height: hp(7),
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    _formKey.currentState.reset();
                                    signUpUser(_email, _password).then((uid) {
                                      saveUserOnDb(_email, uid).then((result) {
                                        print('success');
                                      }).catchError((onError) {
                                        print(onError);
                                      });
                                    }).catchError((onError) {
                                      print(onError);
                                    });
                                  } else {
                                    setState(() {
                                      _autoValidate = true;
                                    });
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(
                                          title: Text("تم تسجيل حسابك بنجاح"),
                                        );
                                      }
                                  );
                                },
                                color: Colors.blue,
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: hp(4),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "------- OR -------",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: hp(5)),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "Sign In",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
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
}
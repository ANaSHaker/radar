import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

import 'HomePage.dart';
import 'Login.dart';



var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomePage(),
};
int initScreen;
Future<void> main() async {

  _setTargetPlatformForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  await Firebase.initializeApp();

  return runApp(MyApp());}


void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class  MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Color(0xffFF375E),
        ));
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");


      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },


    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

  }

  @override
  Widget build(BuildContext context) {
    return  DynamicTheme(
        defaultBrightness: Brightness.light, // Brightness.dark,
        data: (brightness) => ThemeData(
          primarySwatch: Colors.orange,

          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          return  MaterialApp(
            title: '',


            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
            routes: {
              '/': (context) => HomePage(),
              "first": (context) => HomePage(),

            },


          );}
    );
  }
}



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String password;

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Logged in as ${password.toString()} '),
    );
  }
}

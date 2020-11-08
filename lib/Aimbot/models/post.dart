import 'package:firebase_database/firebase_database.dart';
class Post{

  static const KEY = "key";
  static const DATE = "date";
  static const TITLE = "title";
  static const BODY = "body";
  static const BODY2 = "body2";
  static const BODY3 = "body3";
  static const BODY4 = "body4";


  int date;
   String key;
   String title;
   String body;
  String body2;
  String body3;
  String body4;


  Post(this.date, this.title, this.body, this.body2, this.body3, this.body4);

//  String get key  => _key;
//  String get date  => _date;
//  String get title  => _title;
//  String get body  => _body;



  Post.fromSnapshot(DataSnapshot snap):
        this.key = snap.key,
        this.body = snap.value[BODY],
        this.body2 = snap.value[BODY2],
        this.body3 = snap.value[BODY3],
        this.body4 = snap.value[BODY4],

        this.date = snap.value[DATE],
        this.title = snap.value[TITLE];

  Map toMap(){
    return {BODY: body,BODY2: body2,BODY3: body3,BODY4: body4, TITLE: title, DATE: date, KEY: key};
  }
}
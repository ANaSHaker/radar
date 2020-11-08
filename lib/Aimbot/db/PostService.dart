//import 'package:firebase_course/models/post.dart';
import 'package:firebase_database/firebase_database.dart';


class PostService{
  String nodeName = "aimbots";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;
  Map post;

  PostService(this.post);

  addPost(){
//    this is going to give a reference to the posts node
   database.reference().child(nodeName).push().set(post);
  }

  deletePost(){
    database.reference().child('$nodeName/${post['key']}').remove();
  }

  updatePost(){
    database.reference().child('$nodeName/${post['key']}').update(
      {"title": post['title'], "body": post['body'],"body2": post['body2'],"body3": post['body3'],"body4": post['body4'], "date":post['date']}
    );
  }
}
import 'package:flutter/material.dart';

import 'package:pubg/Videos/models/post.dart';
import 'package:pubg/Videos/screens/viewPost.dart';
import '../../HomePage.dart';
import '../../myApp.dart';
import '../../myDrawer.dart';
import '../../webView.dart';
import 'add_post.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeVideo extends StatefulWidget {
  @override
  _HomeVideoState createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "aimbot";
  List<Post> postsList = <Post>[];


  @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4E008A),
        title:Text("الفيديو",style: TextStyle(color: Colors.white,fontSize:20),),
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
        ),
        child: ListView(
          children: <Widget>[
            Visibility(
              visible: postsList.isEmpty,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

        Container(
          height:750,
          child: Column(
             children: [
               Visibility(
                 visible: postsList.isNotEmpty,
                 child: Flexible(
                     child: FirebaseAnimatedList(
                         query: _database.reference().child('aimbot'),
                         itemBuilder: (_, DataSnapshot snap, Animation<double> animation, int index){
                           return Padding(
                             padding: const EdgeInsets.only(top:20.0,right:20,left: 20),
                             child: Container(
                               height: 50,
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                   color: Color(0xff4E008A),
                                   borderRadius: BorderRadius.circular(20)
                               ),
                               child:  ListTile(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>   webview(
                                     pageTitle:  postsList[index].title,
                                     pageUrl: postsList[index].body,
                                   )));
                                 },
                                 title: Text(
                                   postsList[index].title,
                                   style: TextStyle(
                                       fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.white),
                                   textAlign: TextAlign.center,
                                 ),


                                 /* Padding(
                                  padding: const EdgeInsets.only(bottom: 14.0),
                                  child: Text(postsList[index].body, style: TextStyle(fontSize: 18.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),*/
                               ),
                             ),
                           );
                         })),
               ),
             ],
          ))
          ],
        ),
      ),
    /*  floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPost()));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        tooltip: "add a post",
      ),*/
    );
  }

   _childAdded(Event event) {
    setState(() {
      postsList.add(Post.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedPost = postsList.singleWhere((post){
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList.removeAt(postsList.indexOf(deletedPost));
    });
  }

  void _childChanged(Event event) {
    var changedPost = postsList.singleWhere((post){
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList[postsList.indexOf(changedPost)] = Post.fromSnapshot(event.snapshot);
    });
  }
}

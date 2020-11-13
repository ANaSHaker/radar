import 'dart:async';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pubg/myApp.dart';
import 'package:pubg/news/models/post.dart';
import 'package:pubg/news/screens/viewPost.dart';
import '../../HomePage.dart';
import '../../myDrawer.dart';
import 'add_post.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeNews extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "posts";
  List<Post> postsList = <Post>[];


  @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);
    startTimer();


  }
  Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            _start = 60;
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4E008A),
        title:Text("الاخبار",style: TextStyle(color: Colors.white,fontSize:20),),
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
                child: CircularProgressIndicator(),
              ),
            ),



                Visibility(
                    visible: postsList.isNotEmpty,
                    child: Container(
                      height:750,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("تتحدث اخبار الامان كل $_start ثانيه",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                          ),
                          Flexible(
                              child: FirebaseAnimatedList(
                                  query: _database.reference().child('posts'),
                                  itemBuilder: (_, DataSnapshot snap, Animation<double> animation, int index){
                                    return Padding(
                                      padding: const EdgeInsets.only(top:20.0,right: 16,left: 16),
                                      child:  Container(
                                        height: 80,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xff4E008A),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: ListTile(
                                          onTap: (){
                                            //  Navigator.push(context, MaterialPageRoute(builder: (context) => PostView(postsList[index])));
                                          },
                                          title:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                postsList[index].title,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.0, fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.center,),
                                              Container(
                                                width: 120,
                                                height: 40,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),      child:postsList[index].body == "safe" ? Text(postsList[index].body, style: TextStyle(
                                                  color:Colors.greenAccent,
                                                  fontSize: 18.0),) : Text(postsList[index].body, style: TextStyle(
                                                  color:Colors.red,
                                                  fontSize: 18.0),),
                                              )
                                            ],
                                          ),

                                        ),
                                      ),

                                    );
                                  })),
                        ],
                      ),
                    )
                ),
              
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
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

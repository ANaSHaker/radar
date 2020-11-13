import 'package:pubg/Aimbot/models/post.dart';
import 'package:flutter/material.dart';
import '../../HomePage.dart';
import '../../myApp.dart';
import '../../myDrawer.dart';
import 'add_post.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pubg/Aimbot/screens/viewPost.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeAimbot extends StatefulWidget {
  @override
  _HomeAimbotState createState() => _HomeAimbotState();
}

class _HomeAimbotState extends State<HomeAimbot> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "aimbots";
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
        title:Text("اعدادات الايمبوت",style: TextStyle(color: Colors.white,fontSize:20),),
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


        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xffCBBFD5),
                border: Border.all(color: Color(0xff4E008A),width: 5)
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
                         flex: 1,
                         child: FirebaseAnimatedList(
                             query: _database.reference().child('aimbots'),
                             itemBuilder: (_, DataSnapshot snap, Animation<double> animation, int index){
                               return   Container(
                                 height: 1000,
                                 child:  GridView.builder(
                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                         crossAxisCount: 2,
                                         childAspectRatio: 2.5),
                                     itemCount:postsList.length,
                                     padding: EdgeInsets.all(2.0),
                                     itemBuilder: (BuildContext context, int index) {
                                       return Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Container(
                                             alignment: Alignment.center,
                                             decoration: BoxDecoration(
                                                 color: Color(0xff4E008A),
                                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomRight:Radius.circular(40) )
                                             ),
                                             child:ListTile(
                                               onTap: (){
                                                 // Navigator.push(context, MaterialPageRoute(builder: (context) => PostView(postsList[index])));
                                                 showDialog(context: context,
                                                     builder: (_) =>AlertDialog(
                                                       title: Text(postsList[index].title,
                                                         style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                       backgroundColor: Color(0xff4E008A),
                                                       elevation: 0.0,
                                                       actions: <Widget>[
                                                         Column(
                                                           children: [
                                                             postsList[index].body.length <= 2 ? Text("") :  Text(postsList[index].body,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                             SizedBox(height: 5,),
                                                             postsList[index].body2.length <= 2 ? Text("") :  Text(postsList[index].body2,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                             SizedBox(height: 5,),

                                                             postsList[index].body3.length <= 2 ? Text("") :  Text(postsList[index].body3,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                             SizedBox(height: 5,),

                                                             postsList[index].body4.length <= 2 ? Text("") :  Text(postsList[index].body4,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                                                           ],
                                                         )
                                                       ],
                                                     )
                                                 );
                                               },
                                               title: Text(
                                                 postsList[index].title,
                                                 style: TextStyle(
                                                     fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white),
                                                 textAlign: TextAlign.center,
                                               ),


                                             ),
                                           ),
                                         );}
                                 ),
                               );
                             })),
                   ),
                 ],
                ))
              ],
            ),
          ),
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

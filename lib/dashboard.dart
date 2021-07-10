import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/chat/search4.dart';
import 'package:fire99/chat1.dart';
import 'package:fire99/new1.dart';
import 'package:fire99/posts.dart';
import 'package:fire99/profile.dart';
import 'package:fire99/save2.dart';
import 'package:fire99/sms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'add_post.dart';
//import 'fchat/screens/chat_screen.dart';
//import 'fchat/screens/main2.dart';
import 'fchat/screens/chat_screen2.dart';
import 'login.dart';
import 'messages/main99.dart';

class DashboardScreen extends StatefulWidget{
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  File _image;
  String _url;
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Log Out',style: TextStyle(fontSize: 18,color: Colors.white),),
            color: Colors.blue,
            onPressed: () async{
              WidgetsFlutterBinding.ensureInitialized();
                     await Firebase.initializeApp();
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            }
          ),
        ],
      ),
      body: Container(
        child:  Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Add Post'),
              onPressed:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost()));
              }

            ),
            RaisedButton(
              child: Text('See All Posts'),

              onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PostsScreen()));
              }
         
            ),

             RaisedButton(
              child: Text('Msgs CHAT'),

              onPressed:() async {
                final user = FirebaseAuth.instance.currentUser;
                final userData = await Firestore.instance.collection('users').doc(user.uid).get();
                String ud=userData['email'];
                Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatScreen2(ud)));
              }
         
            ),
            RaisedButton(
                child: Text('saving deals'),

                onPressed:()async {
                 final user = FirebaseAuth.instance.currentUser;
                  final userData = await Firestore.instance.collection('users').doc(user.uid).get();
                  String ud=userData['email'];
                  Navigator.push(context, MaterialPageRoute(builder: (context) => save2(ud)));
                }

            ),

            RaisedButton(
                child: Text('profile'),
                onPressed:() async {
                  final user = FirebaseAuth.instance.currentUser;
                  final userData = await Firestore.instance.collection('users').doc(user.uid).get();
                  String ud=userData['email'];
                  Navigator.push(context, MaterialPageRoute(builder: (context) => profile(ud)));
                }
            ),

            RaisedButton(
                child: Text('Msgs'),

                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp99()));
                }

            ),
          ],
          )
        
        ),

    );
  }
 void pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

   //set state bt3ml update kol shwya
   
    setState(() {
      _image = image;
    });
  }
  Future uploadImage(context) async {
    try {
      FirebaseStorage storage =
          // ignore: deprecated_member_use
          FirebaseStorage(storageBucket: 'gs://fire999-6d8b9.appspot.com');
         
      //StorageReference ref = storage.ref().child(_image.path);
     // StorageUploadTask storageUploadTask = ref.putFile(_image);
     // StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
      
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('success'),
      ));
    //  String url = await taskSnapshot.ref.getDownloadURL();
     // print('url $url');
      setState(() {
       // _url = url;
      });
    } 
    catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.message),
      ));
    }
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/new.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat/messages2.dart';
import 'chat/new_message.dart';

class ChatScreen2 extends StatefulWidget {

  final String owner;


  ChatScreen2(this.owner);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen2>

{
  //final _nativeAd=NativeAdmobController();


  @override
  void initState(){
    super.initState();


   /* final fbm=FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage :(msg){
      print(msg);
      return;
    },
        onLaunch:(msg){
          print(msg);
          return;
        },

        onResume:(msg){
          print(msg);
          return;
        }
    );*/
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userData = FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar:  AppBar(
       backgroundColor:Colors.white,
         iconTheme: IconThemeData(color: Colors.black),
        title:Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                 // Colors.white,
                  Colors.white,
                  //Colors.lightBlueAccent,

                 // Colors.lightBlueAccent,
                  Colors.white,
                ])),
          height:30,
            child: Center(child: Row(
              children: [
                Text("   Sw",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:21)),
                Text("ap",style:TextStyle(color:Colors.red,fontWeight:FontWeight.w600,fontSize:21)),
                Text("  Broker",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:21)),

              ],
            ))
        ),
        //backgroundColor: Colors.lightBlueAccent,
         

          
      ),

      // .fromRGBO(41, 30, 80, 1),

     // drawer:SidebarPage(),

      body:Container(
        decoration: BoxDecoration(
           /* gradient: LinearGradient(colors: [
              Colors.blue,
               Colors.white,

            ])*/),
        child: Column(
            children:[

             /* Container(
                  width:310,
                  height:81,
                  child:NativeAdmob(
                    adUnitID:AdsManger.nativeAdunit,
                    numberAds:3,
                    controller: _nativeAd,
                    type:NativeAdmobType.banner,
                  )
              ),*/

             /* SizedBox(
                height:5,
              ),
              Text( "Notification",style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900),),
              SizedBox(
                height:5,
              ),

              SizedBox(
                height:5,
              ),*/
              Expanded(
                child:
                Container(child: Messages2(widget.owner)),
              ),
              SizedBox(
                height:10,
              ),
              //NewMessage(widget.Msgto),
            ]

        ),

      ),



    );
  }
  Widget displayUser(context,snapshot){
    final docs =snapshot.data.docs;
    final user = FirebaseAuth.instance.currentUser;
    Key key;
    key=docs[snapshot].documentID;
    // key:ValueKey(docs[index].documentID),
  }

}


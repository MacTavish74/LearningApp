import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fire99/posts2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'actions.dart';
import 'chat/search4.dart';
import 'login.dart';
import 'package:fire99/posts.dart';
import 'package:fire99/posts3.dart';
import 'package:fire99/posts4.dart';
import 'package:fire99/posts5.dart';
import 'package:fire99/posts6.dart';

class p6 extends StatelessWidget {
  String allposts;
  String v;


  void filterCategory(value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("S w")),
        backgroundColor: Colors.red,

      ),

      drawer: Dw(),
      body:
      Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:100,
                ///   child: cars()
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: 40,
              // child: Row(children: <Widget>[


              // ]
              // ),
            ),
            Flexible(

                child: StreamBuilder(

                    stream:
                    Firestore.instance.collection('posts5').where("category",isEqualTo:'others').snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return Center(child: Text('Loading'));
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Text('Loading...');
//.where("category", isEqualTo:"tec")
                        default:
                          return ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot posts = snapshot.data.documents[index];

                                return Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 220,
                                      color: Colors.white10,
                                      width: MediaQuery.of(context).size.width / 1.1,
                                      child: InkWell(
                                        child: Card(
                                          child: Image.network(posts['img'],
                                              fit: BoxFit.cover),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) {
                                              return Action99(
                                                posts['name'],
                                                posts['des'],
                                                posts['price'],
                                                posts['img'],
                                                posts['user']['email'],
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: ListTile(
                                        leading: Image.network(posts['img']),
                                        title: Text(posts['name'],
                                            style: TextStyle(color: Colors.redAccent)),
                                        subtitle: Text("DESCRIPTION:" + posts['des']),
                                        trailing: Text(posts['price'] + "\$"),
                                      ),
                                    ),
                                  ],
                                );
                              });
                      }
                    })
            ),
            CurvedNavigationBar(
                backgroundColor:Colors.red,
                items:<Widget>[
                  Icon(Icons.verified_user,size:20,color:Colors.black),
                  Icon(Icons.home,size:20,color:Colors.blue),
                  Icon(Icons.add_box,size:20,color:Colors.orange),
                  Icon(Icons.search,size:20,color:Colors.cyan),
                  Icon(Icons.account_circle,size:20,color:Colors.red),
                ],
                onTap:(index){
                  if(index==1)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Posts6();
                      }),
                    );
                  }

                  if(index==2)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Posts3();
                      }),
                    );
                  }


                }

            )
          ]),
    );
  }
}

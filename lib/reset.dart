import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Reset Password',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
      
      body: 
      Container(color:Colors.grey[850],
      child:
      Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Enter Your Email",
                fillColor:Colors.white ,filled: true
,border: OutlineInputBorder( borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),focusedBorder:OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              

                            )
                ),
               onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Text('Reset password'),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                },
                color: Theme.of(context).accentColor,
              ),

            ],
          ),

        ],),

      )
    );
  }
}
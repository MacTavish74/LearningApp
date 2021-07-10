import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/login2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class RegisterScreen2 extends StatefulWidget{
  @override
  _RegisterScreen2State createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  void initState()
  {
    super.initState();
  }
String valuechoosee;
  List listitem =["Male","Female"];
   /* DateTime currentDate=new DateTime.utc(2000,2,14);
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1930),
        lastDate: DateTime(2022));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }*/
  _showDataPicker() async {
    Locale myLocale = Localizations.localeOf(context);
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2022),
        locale: myLocale);
    setState(() {
      _time = picker.toString();
    });
  }

 

  var _time;

 
  final _formkey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _countrycontroller = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();

  TextEditingController _dateofbirth = TextEditingController();

  TextEditingController _gender = TextEditingController();


  @override
  void dispose()
  {
    _namecontroller.dispose();

    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    _countrycontroller.dispose();

    _phonenumber.dispose();

    _dateofbirth.dispose();

    _gender.dispose();

    super.dispose();
  }


  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        title: Text('Registeration'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: Icon(Icons.app_registration),
        //elevation:0,
        actions: <Widget> [
          IconButton(
              icon: Icon(Icons.login),
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen2()),
    ), )],
      ),

      body: Container(color:Colors.grey[850],
        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
        child: Form(
          key: _formkey,
          child:ListView(
            children: <Widget>[

              TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Name',
                 fillColor:Colors.white ,filled: true
,border: OutlineInputBorder( borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),focusedBorder:OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              

                            )
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Name';
                  }
                  // return 'Valid Name';
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                 fillColor:Colors.white ,filled: true
,border: OutlineInputBorder( borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),focusedBorder:OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              

                            )
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Email ';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                 obscureText: true,
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                 fillColor:Colors.white ,filled: true
,border: OutlineInputBorder( borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),focusedBorder:OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              

                            )
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Password';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _countrycontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  labelText: 'Country',
                 fillColor:Colors.white ,filled: true
,border: OutlineInputBorder( borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),focusedBorder:OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              

                            )
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Country';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _phonenumber,
                 keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: 'Phone Number',
                  
                fillColor:Colors.white ,filled: true
,border: OutlineInputBorder( borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),focusedBorder:OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              

                            )
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Fill Number';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

             /* Container(
                 padding: EdgeInsets.only(left:25,right:25),
                        decoration:BoxDecoration(border: Border.all(color:Colors.lightBlueAccent,width:1)
                            ,borderRadius: BorderRadius.zero),
                            child:Text(currentDate.toString(),
                            style: TextStyle(color: Colors.black,backgroundColor: Colors.white,fontSize: 25)),
              ),*/

Container(
 
 width: 100,
 child :
            RaisedButton( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
                color: Colors.white,
             /* shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
                color: Colors.white,
                child: Text('Select Date',style: TextStyle(color: Colors.black,fontSize:21),),
              onPressed: () => _selectDate(context),*/
              child: Text(_time == null ? 'Select date': _time,style: TextStyle(color:Colors.black,fontSize: 21),),
          onPressed: () => _showDataPicker(),
             
            ),



),
            
              SizedBox(
                height: 10,
              ),
               Container(
                        padding: EdgeInsets.only(left:25,right:25),
                        decoration:BoxDecoration(color: Colors.white,border: Border.all(color:Colors.white,width:1)
                            ,borderRadius: BorderRadius.circular(25)),
                        child:

               DropdownButton(

                          hint: Text("Select Gender",style:TextStyle(color: Colors.black,fontSize: 17),),
                          
                          icon: Icon(Icons.arrow_drop_down),

                           iconSize: 36,

                          isExpanded: true,
                          underline: SizedBox(),

                          value: valuechoosee,
                          onChanged:(newvalue)
                          {
                            setState(() {
                              valuechoosee=newvalue;
                            });

                          },

                          items: listitem.map((valueitem){

                            return DropdownMenuItem(value: valueitem,

                              child: Text(valueitem),


                            );

                          }).toList(),


                        ),
                        
               ),
              SizedBox(
                height: 10,
              ),

              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
                color: Colors.white,
                child: Text('Submit',style: TextStyle(fontSize:21),),
                onPressed: () async{
                  if(_formkey.currentState.validate()){
                    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
                    if(result != null)
                    {
                      Firestore.instance.collection('users').document(result.user.uid).setData({
                        'name':_namecontroller.text,
                        'country':_countrycontroller.text
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }),
                      );

                    }else{
                      print('please try later');
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
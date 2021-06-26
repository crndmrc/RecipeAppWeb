import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  SignUpPage createState()=> SignUpPage();
}
class SignUpPage extends State<SignUp> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void _create() async {
    try {
      await firestore.collection('users').doc('testUser').set({
        'firstName': 'ceren',
        'lastName': 'demirci',
      });
    } catch (e) {
      print(e);
    }
  }
  void _update() async {
    try {
      firestore.collection('users').doc('testUser').update({
        'firstName': 'benim adım',
      });
    } catch (e) {
      print(e);
    }
  }
  void _read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await   firestore.collection('users').doc('testUser').get();
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }
  void _delete() async {
    try {
      firestore.collection('users').doc('testUser').delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation:0.0,
          centerTitle: true,
          leading: IconButton(
            icon:Icon(Icons.arrow_back,color:Color(0xFF545D68)),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          title:Text("BulmamLazım.COM",
            style:TextStyle(fontFamily: 'Varela',fontSize: 20.0,color:Color(0xFF545D68)),
          ),
        ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          RaisedButton(
            child: Text("Create"),
            onPressed: _create,
          ),
          RaisedButton(
            child: Text("Read"),
            onPressed: _read,
          ),
          RaisedButton(
            child: Text("Update"),
            onPressed: _update,
          ),
          RaisedButton(
            child: Text("Delete"),
            onPressed: _delete,
          ),
        ]),
      ),
    );
  }
}
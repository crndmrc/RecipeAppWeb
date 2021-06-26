import 'package:flutter/material.dart';

import 'home_page.dart';
class SplashScreenpage extends StatefulWidget{
  SplashScreenState createState()=> SplashScreenState();
}
class SplashScreenState extends State<SplashScreenpage>{
@override
void initState(){
  super.initState();
  Future.delayed(Duration(seconds: 3),(){
  Navigator.push(context,
  MaterialPageRoute(builder: (context)=>HomePage()),);
  });
}
@override
Widget build(BuildContext context){
  return Scaffold(
    body:Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/splashscreen.png"),
          fit: BoxFit.cover
        ),
      ),
    ),
  );
}
}
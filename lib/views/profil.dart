import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'signup.dart';

class ProfilPage extends StatefulWidget{
  ProfilState createState()=> ProfilState();
}
class ProfilState extends State<ProfilPage>with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
            DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText('Bize'),
                  FadeAnimatedText('Katılmak'),
                  FadeAnimatedText('İster misiniz?'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageFiltered(
                        imageFilter: ImageFilter.blur( sigmaY: 2,sigmaX: 2),
                        child: GestureDetector(
                        child:Image.asset("images/bulmamlazim.jpg",),
                          onDoubleTap:(){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()),);},),
                        ),
                  ],
                ),
              ),
            ),
            Tooltip(message: 'Veritabanına ekleme yapmak için tıklayınız',
              child:GestureDetector(
              child:ElevatedButton(child:
              Text("Firebase İşlemi"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEF7532),
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUp()),);},),
            ),
            ),
          ],)
      ),
    );
  }
}

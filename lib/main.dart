import 'package:flutter/material.dart';
import 'views/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {

  runApp(MaterialApp(
    title:"BulmamLazım.COM",
    debugShowCheckedModeBanner:false,
    theme:ThemeData(
      primarySwatch: Colors.orange,
    ),
    home:SplashScreenpage(),
  ));
}

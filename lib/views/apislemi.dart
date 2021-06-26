import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobilapp/modules/load_data.dart';

Future<Welcome> apiCall() async {
  final response = await http.get(
      'https://api.edamam.com/search?q=ekmek&app_id=fc6b731d&app_key=d50204a3f5d071eb46822d1292c48d32');
  if (response.statusCode == 200) {
    return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: apiPage(title: 'Json API'),
    );
  }
}

class apiPage extends StatefulWidget {
  apiPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _apiPageState createState() => _apiPageState();
}

class _apiPageState extends State<apiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Welcome>(
        future: apiCall(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                    child: Text(
                      " ${snapshot.data.count} \n" +
                        " ${snapshot.data.from} \n"+
                          " ${snapshot.data.hits} \n"+
                          " ${snapshot.data.more} \n"+
                          " ${snapshot.data.to} \n"+
                          " ${snapshot.data.q} \n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

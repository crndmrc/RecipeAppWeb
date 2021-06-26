import 'package:flutter/material.dart';

import 'alisverisSepeti.dart';
import 'olculer.dart';
class MalzemelerPage extends StatefulWidget{
  MalzemelerState createState()=> MalzemelerState();
}
class MalzemelerState extends State<MalzemelerPage>{
  bool _isChecked = false;
  String _currText = '';
  final _c = TextEditingController();
  List<String> text = ["200 Gram Doğranmış Tereyağı", "220 Gram Doğranmış Bitter Çikolata", " 1,5 Su Bardağı Toz Şeker"," 5 Adet Oda Sıcaklığında Yumurta","2 Çorba Kaşığı Un" ];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body:Column(
          children:[
            Expanded(
              child: Container(
                height: 350.0,
                child: Column(
                  children: text
                      .map((t) => CheckboxListTile(
                    checkColor: Colors.white,
                    title: Text(t),
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val;
                        if (val == true) {
                          _currText = t;
                        }
                      });
                    },
                  ))
                      .toList(),
                ),),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEF7532),
                  ),
                  onPressed: showAlert, child: Text("Alışveriş sepetine ekle")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEF7532),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OlculerPage()),);
                  }, child: Text("Ölçüler")),
            ),
          ],
        ),
      ),
    );
  }
  void showAlert() {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => AlisverisSepetiPage(text:_currText,)),);
    AlertDialog alertDialog;
    alertDialog = AlertDialog(
      title: Text("Alışveris Listesine Eklendi"),
      content: Text("İşlem başarılı bir şekilde gerçekleşti."),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
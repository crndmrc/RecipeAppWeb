import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HesaplamaPage extends StatefulWidget{
  HesaplamaState createState()=> HesaplamaState();
}
class HesaplamaState extends State<HesaplamaPage>with SingleTickerProviderStateMixin{
  final controllerBoy = TextEditingController();
  final controllerKilo = TextEditingController();
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.indigo.shade200,
        elevation: 20,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Vücut Kitle İndeksi Hesaplama",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(19.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controllerBoy,
                decoration: InputDecoration(
                  hintText: "Boyunuzu girin",
                  labelText: "Boy ör (1.79)",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(19.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controllerKilo,
                decoration: InputDecoration(
                  hintText: "Kilonuzu girin",
                  labelText: "Kilo ör (80)",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            Text(
              "Durum : $data",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
            RaisedButton(
              color: Colors.orangeAccent,
              child: Text(
                "Hesapla",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(
                      () {
                    if (controllerBoy.text.isNotEmpty &&
                        controllerKilo.text.isNotEmpty) {
                      double valueBoy = double.parse(controllerBoy.text);
                      double valueKilo = double.parse(controllerKilo.text);
                      double indeks = valueKilo / (valueBoy * valueBoy);

                      if (indeks < 18) {
                        data = "Zayıf \n\n VKİ : ${indeks.toStringAsFixed(5)} ";
                      } else if (indeks >= 18 && indeks < 25) {
                        data =
                        "Normal \n\n  VKİ : ${indeks.toStringAsFixed(5)}";
                      } else if (indeks >= 25 && indeks < 30) {
                        data = "Kilolu \n\n VKİ : ${indeks.toStringAsFixed(5)}";
                      } else if (indeks >= 30 && indeks < 35) {
                      } else {
                        data =
                        "Ciddi Obez \n\n VKİ : ${indeks.toStringAsFixed(5)}";
                      }
                    } else {
                      data = "Boy veya kilo boş olamaz ! ";
                    }
                    ;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
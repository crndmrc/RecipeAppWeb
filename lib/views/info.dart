import 'package:flutter/material.dart';
class Info extends StatefulWidget{
  Infopage createState()=> Infopage();
}
class Infopage extends State<Info> {
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
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        children: <Widget>[
          Image.asset("images/bulmamlazim.jpg"),
          Text('Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301409 kodlu MOBİL PROGRAMLAMA dersi kapsamında 173301034 numaralı Ceren DEMİRCİ tarafından 29.04.2021 günü yapılmıştır.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 18.0,
            ),),
        ],),
    );
  }
}
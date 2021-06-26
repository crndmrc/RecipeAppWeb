import 'package:flutter/material.dart';
class Recipe3page extends StatefulWidget{
  Recipe3State createState()=> Recipe3State();
}
class Recipe3State extends State<Recipe3page>{
  int currentTab = 0;
  Widget currentScreens = Recipe3page();
  var recipe3=[
    {
      'Adi':'Haşhaşlı Revani',
      'Malzemeler':['Şerbeti için: 3 su bardagı seker, 2.5 su bardagı su, 1-2 damla limon ( kaynadıktan sonra altını kısıp, kısık ateste 3-4 dakika tutup altını kapatalım ve sogumaya bırakalım) Keki için 3 yumurta, 1 su bardagı şeker, 1 su bardağı yogurt, 1 su bardağı sıvıyağ, 1 su bardagı irmik, 1 çay bardağı mavi haşhaş, 1 su bardagı un, 1 paket kabartma tozu, 1 paket vanilya'],
      'Yapilisi':' seker ve yumurtayı köpürene kadar çırpalım. Sıvıyag, yoğurt, irmik ve hashaşı ekleyip kısa düre çırpalım. En son un, vanilya ve kabartma tozunu ekleyip çırpalım.. Orta boy bir fırın kabını yağlayıp karısımı dökelim.. 180 derecede fırını ısıtıp keki pişirelim.. Fırından çıkardıktan 5 dakika sonra soguk serbeti üzerine dökelim.. Tatlı tamamen soguyunca üzerine düz bir dekilde krem şanti sürelim..( 1 poset krem santiyi 1 cay bardagı soğuk sütle hazıtlayıp krem şsntiyi hazırlayabilirsiniz) Dolapta krem şanti bir miktar sertlestikten sonra dilimleyip servis yapabilirsiniz.. Süslemede mavi hashas, nane ve kiraz sekeri kullandım.. Yapan herkese afiyet olsun 😘'
    }
  ];
  Widget build(BuildContext context){
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
          style:TextStyle(fontFamily: 'Varela',fontSize: 20.0,color:Color(0xFF545068)),
        ),
      ),
      body:Column(
        children: <Widget>[
          Expanded(child:InkWell(
            child: Image.asset("images/tatlilar/recipe3.jpg"),
          ),),
          Text(recipe3.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
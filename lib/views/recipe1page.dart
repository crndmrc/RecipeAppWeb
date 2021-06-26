import 'package:flutter/material.dart';

import 'fotograflar.dart';
import 'hazirlanisi.dart';
import 'malzemeler.dart';
class Recipe1page extends StatefulWidget{
  Recipe1State createState()=> Recipe1State();
}
class Recipe1State extends State<Recipe1page>with SingleTickerProviderStateMixin{
  int currentTab = 0;
  Widget currentScreens = Recipe1page();
  var recipe1=[
    {
      'Adi':'Fondan Kek',
      'Malzemeler':['200 Gram Doğranmış Tereyağı,220 Gram Doğranmış Bitter Çikolata, 1,5 Su Bardağı Toz Şeker, 5 Adet Oda Sıcaklığında Yumurta,2 Çorba Kaşığı Un'],
      'Yapilisi':'Tereyağını benmari düzeneğine alın. çikolataları ekleyin. tamamen erimelerini sağlayın.Ocaktan alıp şekeri ekleyin ve erimesini sağlayın. Yumurtaların her birini teker teker ekleyin. Unu ekleyip sadece karışana kadar karıştırın.Pişirme kağıdı serili 22 cm\'lik kelepçeli kek kalıbına harcı sıyırın. Önceden ısıtılmış 200 derecelik fırında 25 dakika kadar pişirin. Kürdan batırdığınızda bir miktar nemli olmalı. 15 dakika dinlendikten sonra dilimleyerek servis edebilirsiniz.'
    }
  ];
  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 3,vsync: this);
  }
  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'BulmamLazim.com',
          style: TextStyle(
            fontFamily:'Varela',
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orangeAccent,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.orangeAccent,
          indicatorWeight: 5.0,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: <Widget>
          [
            Tab(text: 'Fotoğraflar',
            ),
            Tab(text:'Malzemeler',
            ),
            Tab(text: 'Hazırlanışı',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FotografPage(),
          MalzemelerPage(),
          HazirlanisPage(),
        ],),
      bottomNavigationBar: BottomAppBar(
        shape:CircularNotchedRectangle(),
        child:Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentTab=0;
                      },);
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.date_range,color:currentTab==0?Colors.black: Colors.grey),
                        Text('Ekle',style: TextStyle(color:currentTab==0?Colors.black: Colors.grey),),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      _displayTextInputDialog(context);
                      setState(() {
                        currentTab=1;
                      },);
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.share,color:currentTab==1?Colors.black: Colors.grey),
                        Text('Paylaş',style: TextStyle(color:currentTab==1?Colors.black: Colors.grey),),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentTab=2;
                      },);
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star,color:currentTab==2?Colors.black: Colors.grey),
                        Text('Favori',style: TextStyle(color:currentTab==2?Colors.black: Colors.grey),),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentTab=3;
                      },);
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.assignment,color:currentTab==3?Colors.black: Colors.grey),
                        Text('Yorumlar',style: TextStyle(color:currentTab==3?Colors.black: Colors.grey),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: <Widget>[
          ],
        );
      },
    );
  }
}


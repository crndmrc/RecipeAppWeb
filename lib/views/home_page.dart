import 'package:flutter/material.dart';
import 'package:mobilapp/views/veritabaniylaTarifEkleme/recipelist.dart';
import 'anasayfa.dart';
import 'animation.dart';
import 'apislemi.dart';
import 'dragable.dart';
import 'grafik.dart';
import 'hesaplama.dart';
import 'info.dart';
import 'profil.dart';
class HomePage extends StatefulWidget{
  Homepage createState()=> Homepage();
}
class Homepage extends State<HomePage>{
  bool tapped = false;
  int currentTab = 0;
  Widget currentScreens = Anasayfa();
  final PageStorageBucket bucket = PageStorageBucket();
  bool isSwitched = true;
  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.orange
  );
  ThemeData _darkTheme =ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber
  );
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: isSwitched ? _lightTheme : _darkTheme,
      home:Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation:0.0,
          centerTitle: true,
          title:Text("BulmamLazım.COM",
            style:TextStyle(fontFamily: 'RaleWay',fontSize: 20.0,color:Color(0xFF545068),
            ),
          ),
          iconTheme: IconThemeData(color: Color(0xFF545068)),
          actions: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (state) {
                setState(() {
                  isSwitched = state;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.deepOrangeAccent,
              activeColor: Colors.orangeAccent,
            ),
          ],
        ),
        body:PageStorage(
          child: currentScreens,
          bucket:bucket,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child:Image.asset("images/bulmamlazim.jpg"),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                leading:IconButton(
                    icon:Icon(Icons.accessibility_new,color: tapped ? Colors.orangeAccent : Colors.green,
                      size: 40.0,),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>HesaplamaPage()),);
                    },
                ),
                title: Text('Hesaplama'),
                onLongPress: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>HesaplamaPage()),);
                },
              ),
              ListTile(
                leading: IconButton(
                    icon:Icon(Icons.stairs_outlined,color: tapped ? Color(0xFF545D68) : Colors.orangeAccent,
                      size: 30.0,),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>GrafikPage()),);
                    },
                ),
                title: Text('Grafik'),
                onLongPress: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>GrafikPage()),);
                },
              ),
              ListTile(
                leading: IconButton(
                    icon:Icon(Icons.stairs_outlined,color: tapped ? Color(0xFF545D68) : Colors.orangeAccent,
                      size: 30.0,),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>PieChartPage()),);
                    },
                ),
                title: Text('Animasyon'),
                onLongPress: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>PieChartPage()),);
                },
              ),
              ListTile(
                leading: GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      tapped = true;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      tapped = false;
                    });
                  },
                  child: IconButton(
                    icon:Icon(Icons.info,color: tapped ? Color(0xFF545D68) : Colors.orangeAccent,
                      size: 30.0,),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Info()),);
                    },
                  ),
                ),
                title: Text('Hakkımızda'),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Info()),);
                },
              ),
            ],
          ),
        ),
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
                          currentScreens=Anasayfa();
                          currentTab=0;
                        },);
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.home,color:currentTab==0?Colors.black: Colors.grey),
                          Text('Anasayfa',style: TextStyle(color:currentTab==0?Colors.black: Colors.grey),),
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
                          currentScreens=apiPage();
                          currentTab=1;
                        },);
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.search,color:currentTab==1?Colors.black: Colors.grey),
                          Text('Ara',style: TextStyle(color:currentTab==1?Colors.black: Colors.grey),),
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
                          currentScreens=Dragable();
                          currentTab=2;
                        },);
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.help_outline,color:currentTab==2?Colors.black: Colors.grey),
                          Text('Bilgi',style: TextStyle(color:currentTab==2?Colors.black: Colors.grey),),
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
                          currentScreens=RecipeList();
                          currentTab=3;
                        },);
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add,color:currentTab==3?Colors.black: Colors.grey),
                          Text('Ekle',style: TextStyle(color:currentTab==3?Colors.black: Colors.grey),),
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
                          currentScreens=ProfilPage();
                          currentTab=4;
                        },);
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.account_box,color:currentTab==4?Colors.black: Colors.grey),
                          Text('Profil',style: TextStyle(color:currentTab==4?Colors.black: Colors.grey),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
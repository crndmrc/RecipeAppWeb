import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'recipe1page.dart';
import 'recipe3page.dart';
class Anasayfa extends StatefulWidget{
  @override
  AnasayfaPage createState()=> AnasayfaPage();
}
class AnasayfaPage extends State<Anasayfa>{
  int selected = 0;
  int rotation_count=10;
  List<int>point=[0,0,0,0,0,0,0,0];
  final items = <String>[
    'Kadayıf Dolma',
    'Cheesecake',
    'Browni',
    'Cookie',
    'Islak Kurabiye',
    'Paris Prest',
    'Baklava',
    'Katmer',
  ];
  @override
  void initState() {
    super.initState();
    point=[0,0,0,0,0,0,0,0];
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:ListView(
        padding: EdgeInsets.only(left: 20.0,right: 20.0),
        children: <Widget>[
          Text('Bugün ne pişirmek istersiniz?',
            style: TextStyle(
              fontFamily:'Varela',
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height:10,),
          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("images/tatlilar/recipe1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("images/tatlilar/recipe2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("images/tatlilar/recipe3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("images/tatlilar/brownie.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('Fondan Kek', 'images/tatlilar/recipe1.png', false, false, context),
                Padding(padding: EdgeInsets.only(top:15.0,bottom:5.0,left:5.0,right:5.0),
                  child: InkWell(
                    onDoubleTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Recipe3page()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.favorite,color:Color(0xFFEF7532)),
                              ],
                            ),
                          ),
                          Container(
                            height:75.0,
                            width: 75.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/tatlilar/recipe3.jpg'),
                                  fit:BoxFit.contain,
                                )
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Text(
                            'Haşhaşlı Revani',
                            style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Varela',
                              fontSize: 14.0,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCard(String name,String imgPath,bool added, bool isFavorite,context){
    return Padding(padding: EdgeInsets.only(top:15.0,bottom:5.0,left:5.0,right:5.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Recipe1page()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isFavorite ? Icon(Icons.favorite,color:Color(0xFFEF7532)):
                      Icon(Icons.favorite_border,color: Color(0xFFEF7532))
                    ]
                ),
              ),
              Hero(
                tag: imgPath,
                child:Container(
                  height:75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image:  AssetImage(imgPath),
                        fit:BoxFit.contain,
                      )
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Text(
                name,
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 14.0),),
              Padding(padding: EdgeInsets.all(8.0),
                child: Container(
                  color:Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
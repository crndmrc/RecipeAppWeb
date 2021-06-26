import 'package:flutter/material.dart';
import 'dart:math'as math;
class OlculerPage extends StatefulWidget{
  String not='';
  State createState()=> OlculerState();
}
class OlculerState extends State<OlculerPage>{
  @override
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
          style:TextStyle(fontFamily: 'Varela',fontSize: 20.0,color:Color(0xFF545D68)),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                color: Colors.black,
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.orangeAccent,
                    child: const Text('Ölçek Listesi',style: TextStyle(
                      fontFamily:'Varela',
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
//          defaultColumnWidth:
//              FixedColumnWidth(MediaQuery.of(context).size.width / 3),
                  border: TableBorder.all(
                      color: Colors.black26, width: 1, style: BorderStyle.none),
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Center(child: Text('Ölçü',style:TextStyle(fontFamily: 'Varela',fontSize: 20.0,color:Color(0xFF545D68),fontWeight: FontWeight.bold),)),
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(child: Text('1 su bardağı',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),)),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(child: Text('1 çay bardağı',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),)),
                      ),
                      TableCell(
                        child: Center(child: Text('1 yk',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),)),
                        verticalAlignment: TableCellVerticalAlignment.top,
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(child: Center(child: Text('Sıvı hacmi',style:TextStyle(fontFamily: 'Varela',fontSize: 20.0,color:Color(0xFF545D68),fontWeight: FontWeight.bold,),))),
                      TableCell(
                        child: Center(child: Text('200 ml',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),)),
                      ),
                      TableCell(child: Center(child: Text('100 ml',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),))),
                      TableCell(child: Center(child: Text('10 ml',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),))),
                    ]),
                    TableRow(children: [
                      TableCell(child: Center(child: Text('Eşdeğeri',style:TextStyle(fontFamily: 'Varela',fontSize: 20.0,color:Color(0xFF545D68),fontWeight: FontWeight.bold),))),
                      TableCell(
                        child: Center(child: Text('2 çay bardağı',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),)),
                      ),
                      TableCell(child: Center(child: Text('10 yk',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),))),
                      TableCell(child: Center(child: Text('2 tk',style:TextStyle(fontFamily: 'Varela',fontSize: 15.0,color:Color(0xFF545D68)),))),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobilapp/services/pie_chart.dart';
import 'package:mobilapp/services/secili_pie_chart.dart';

class PieChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int touchedIndex;
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
          },),
          title:Text("BulmamLazım.COM",
        style:TextStyle(fontFamily: 'Varela',fontSize: 20.0,color:Color(0xFF545D68)),
        ),
        ),
      body: Card(
        child: Column(
          children: <Widget>[
          Text('Araştırmalara Göre Dünyada En Çok Sevilen Yemekler',style:TextStyle(fontFamily: 'Varela',fontSize: 40.0,color:Color(0xFF545D68),fontWeight: FontWeight.bold),),
          Expanded(
            child: PieChart(PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (pieTouchResponse) {
                  setState(() {
                    if (pieTouchResponse.touchInput is FlLongPressEnd ||
                        pieTouchResponse.touchInput is FlPanEnd) {
                      touchedIndex = -1;
                    } else {
                      touchedIndex = pieTouchResponse.touchedSectionIndex;
                    }
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: getSections(touchedIndex),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: IndicatorsWidget(),
            ),
          ],
        ),
      ],
    ),
  ));
}
}


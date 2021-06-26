import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class FotografPage extends StatefulWidget{
  FotografState createState()=> FotografState();
}
class FotografState extends State<FotografPage>{
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'D_WJTgkdYT8', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ));

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 30,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepOrange[600],
                    Colors.cyan[900],
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    //spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(
                        0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Fondan Kek',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
              ),
            ),

            SizedBox(height: 30,),

            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),

            SizedBox(height: 30,),

            InkWell(
              onTap: (){
                _showDialog();
              },
              child: Container(
                height: 70,
                width: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepOrange[600],
                      Colors.yellow[900],
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      //spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(
                          0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Tarif videosu izlemek için tıklayınız',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,  //sadece butonlara basınca ekrandan çıkıyor
      builder: (BuildContext context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(10.0)),
          backgroundColor: Colors.orangeAccent,
          title: Text(
            "Flutter serisi",
            textAlign: TextAlign.center,
          ),
          //content: Text("Hello world"),

          actions: <Widget>[

            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            )
          ],
        );
      },
    );
  }
}
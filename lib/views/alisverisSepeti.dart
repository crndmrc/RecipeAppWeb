import 'package:flutter/material.dart';
import 'package:mobilapp/services/file_utils.dart';

class AlisverisSepetiPage extends StatefulWidget{
  String text;
  AlisverisSepetiPage({this.text});
  AlisverisSepetiState createState()=> AlisverisSepetiState();
}
class AlisverisSepetiState extends State<AlisverisSepetiPage>{
  String _text = "";
  TextEditingController _c;
  @override
  initState(){
    _c = new TextEditingController();
    super.initState();
  }
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
        actions: <Widget>[
          IconButton(icon:Icon(
            Icons.delete,
            color: Colors.orangeAccent,
          ),
            onPressed: (){_showDialog();
            },
          ),
          IconButton(onPressed: (){},
            icon: Icon(
              Icons.share,color: Colors.orangeAccent,
            ),
          )
        ],
      ),
      body:Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.spaceAround,
        runAlignment: WrapAlignment.start,
        verticalDirection: VerticalDirection.up,
        spacing: 20,
        runSpacing: 40,
        children: <Widget>[
          Text(widget.text),
          Text(_text),
          MaterialButton(color: Colors.orangeAccent,onPressed: ()
          {
            FileUtils.readFromFile().then((contents) {
              setState(() {
                _text = contents;
              });
            },);
          },child: Text("Eklediğim Ürünleri Göster"),),
          MaterialButton(color: Colors.orangeAccent,onPressed: ()
          {_displayTextInputDialog(context);},child: new Text("Yeni Ürün Ekle"),),
        ],
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Eklemek istediğiniz ürünü giriniz:'),
          content: TextField(
            controller: _c,
            decoration: InputDecoration(hintText: "Bir ürün yazınız"),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Çık'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('Tamam'),
              onPressed: () {
                FileUtils.saveToFile(_c.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20.0)),
          title: Text("Silmek istediğinize emin misiniz?"),
          content: Text(""),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: MaterialButton(
                shape: StadiumBorder(),
                minWidth: 100,
                color: Colors.orangeAccent,
                child: new Text("Evet"),
                onPressed: () {
                  setState(() {
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),],);},);
  }
}

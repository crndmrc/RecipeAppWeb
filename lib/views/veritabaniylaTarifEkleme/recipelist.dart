import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilapp/modules/note.dart';
import 'package:mobilapp/services/dbhelper.dart';
import 'package:mobilapp/views/veritabaniylaTarifEkleme/recipedetail.dart';

class RecipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeListState();
  }
}

class RecipeListState extends State {
  DbHelper helper = DbHelper();
  List<Note> tarifler;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (tarifler == null) {
      tarifler = [];
      getData();
    }
    return Scaffold(
        body: todoListItems(),
        appBar: AppBar(
          title: Text("Tariflerim"),
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToDetail(Note("", 3, ""));
          },
          tooltip: 'Yeni bir tarif ekle',
          backgroundColor: Colors.orangeAccent,
          child: Icon(Icons.add),
        ));
  }

  ListView todoListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) => Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: getColor(this.tarifler[position].priority),
                child: Text(
                  this.tarifler[position].id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(this.tarifler[position].title),
              subtitle: Text(this.tarifler[position].description),
              onTap: () {
                navigateToDetail(this.tarifler[position]);
              },
            )));
  }

  void navigateToDetail(Note note) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => RecipeDetail(note)));
    if (result == true) {
      getData();
    }
  }

  void getData() {
    final todosFuture = helper.getTarifler();
    todosFuture.then((result) => {
      setState(() {
        tarifler = result;
        count = tarifler.length;
      })
    });
  }

  Color getColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.orange;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.orange;
      default:
        return Colors.orange;
    }
  }
}
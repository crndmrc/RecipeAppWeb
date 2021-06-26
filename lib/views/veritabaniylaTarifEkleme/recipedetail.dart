import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobilapp/modules/note.dart';
import 'package:mobilapp/services/dbhelper.dart';

final List<String> choices = const <String>[menuSave, menuDelete, menuBack];

const menuSave = "Tarifi Kaydet ve Geri Dön ";
const menuDelete = "Tarifi Sil";
const menuBack = "Listeye Geri Dön";

DbHelper helper = DbHelper();

class RecipeDetail extends StatefulWidget {
  final Note note;

  RecipeDetail(this.note);

  @override
  State<StatefulWidget> createState() {
    return RecipeDetailState(note);
  }
}

class RecipeDetailState extends State {
  Note note;

  RecipeDetailState(this.note);

  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  final _formDistance = 5.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    descController.text = note.description;
    var textStyle = Theme.of(context).textTheme.caption;
    var title = note.title == "" ? "Yeni Tarif" : note.title;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(title),
          actions: [
            PopupMenuButton<String>(
              onSelected: select,
              itemBuilder: (BuildContext context) {
                return choices.map((e) {
                  return PopupMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding:
                EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Yemek Adı",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                    controller: descController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Hazırlanışı",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
              ),
              DropdownButton<String>(
                value: this._priorities[this.note.priority - 1],
                items: _priorities.map((String str) {
                  return DropdownMenuItem<String>(
                    value: str,
                    child: Text(str),
                  );
                }).toList(),
                onChanged: (String str) {
                  updatePriority(str);
                },
              ),
              ElevatedButton(onPressed: save, child: Text(menuSave)),
              ElevatedButton(onPressed: delete, child: Text(menuDelete)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(menuBack)),
            ],
          ),
        ));
  }

  void updatePriority(String value) {
    int priority = 0;
    switch (value) {
      case "High":
        priority = 1;
        break;
      case "Medium":
        priority = 2;
        break;
      case "Low":
        priority = 3;
        break;
      default:
    }
    setState(() {
      this.note.priority = priority;
    });
  }

  void select(String value) async {
    switch (value) {
      case menuSave:
        save();
        break;
      case menuDelete:
        delete();
        break;
      case menuBack:
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  void delete() async {
    Navigator.pop(context, true);
    if (note.id == null) {
      return;
    }
    int result;
    result = await helper.deleteNote(note.id);
    if (result != 0) {
      AlertDialog alertDialog = AlertDialog(
        title: Text("Tarifi sil"),
        content: Text("Tarif başarılı bir şekilde silindi"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    }
  }

  void save() {
    note.title = titleController.text;
    note.description = descController.text;
    note.date = new DateFormat.yMd().format(DateTime.now());
    if (note.id != null) {
      helper.updateNote(note);
    } else {
      helper.insertNote(note);
    }
    Navigator.pop(context, true);
    showAlert(note.id != null);
  }

  void showAlert(bool isUpdate) {
    AlertDialog alertDialog;
    if (isUpdate) {
      alertDialog = AlertDialog(
        title: Text("Tarif Güncellendi"),
        content: Text("Tarifinizi başarılı bir şekilde güncellediniz"),
      );
    } else {
      alertDialog = AlertDialog(
        title: Text("Tarif Eklendi"),
        content: Text("Tarif başarılı bir şekilde eklendi"),
      );
    }
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
import 'package:mobilapp/modules/note.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();

  String tblNote = "note";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  DbHelper._internal();

   factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "tarifler.db";
    var dbTarifler = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTarifler;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblNote($colId INTEGER PRIMARY KEY, $colTitle TEXT," +
            "$colDescription TEXT, $colPriority INTEGER, $colDate TEXT" +
            ")");
  }

  Future<int> insertNote(Note note) async {
    Database db = await this.db;
    var result = await db.insert(tblNote, note.toMap());
    return result;
  }

  Future<List> getTarifler() async {
    List<Note> recipeList = [];
    Database db = await this.db;
    var result =
    await db.rawQuery("SELECT * FROM $tblNote ORDER BY $colPriority ASC");
    result.forEach((element) {
      recipeList.add(Note.fromObject(element));
    });
    return recipeList;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $tblNote"));

    return result;
  }

  Future<int> updateNote(Note note) async {
    Database db = await this.db;
    var result = await db.update(tblNote, note.toMap(),
        where: "$colId = ?", whereArgs: [note.id]);
    return result;
  }

  Future<int> deleteNote(int id) async {
    Database db = await this.db;
    var result = await db.delete(tblNote, where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}
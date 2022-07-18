import 'package:Vitel/database/vitel_table.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  Repository._privateConstructor();

  static final Repository instance = Repository._privateConstructor();

  //init database
  static Future<Database> get database async {
    Database _database = await VitelDatabase.setDatabase();
    return _database;
  }

  //insert something to database
  static Future<int> insertData(String table, Map<String, dynamic> data) async {
    Database db = await database;
    try {
      return await db.insert(table, data);
    } catch (e) {
      return await db.insert(table, data);
    }
  }

  //get all data from database
  static Future<List<Map<String, dynamic>>> getAllData(table) async {
    Database db = await database;
    try {
      return db.query(table);
    } catch (e) {
      return db.query(table);
    }
  }

  static Future<int> update(table, Map<String, dynamic> vitel, int id) async {
    Database db = await database;
    return await db.update(table, vitel, where: "id= ?", whereArgs: [id]);
  }

  //delete data
  static Future<int> deleteData(String table, int id) async {
    Database db = await database;
    try {
      return await db.delete(table, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      return await db.delete(table, where: "id = ?", whereArgs: [id]);
    }
  }

  static Future<int> deleteSingleData(table, Map<String, dynamic> vitel, int id) async {
    Database db = await database;
    return await db.update(table, vitel, where: "id= ?", whereArgs: [id]);
  }

  static Future<List<Vitel>> getAllVitels() async {
    List<Vitel> data = [];
    (await Repository.getAllData("Vitel")).forEach((vitelMap) {
      data.add(Vitel.vitelMapToObject(vitelMap));
    });

    return data;
  }
}

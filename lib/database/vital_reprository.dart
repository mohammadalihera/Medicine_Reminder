import 'package:Vitals/database/vital_table.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  Repository._privateConstructor();

  static final Repository instance = Repository._privateConstructor();

  //init database
  static Future<Database> get database async {
    Database _database = await VitalDatabase.setDatabase();
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
static  Future<List<Map<String, dynamic>>> getAllData(table) async {
    Database db = await database;
    try {
      return db.query(table);
    } catch (e) {
      return db.query(table);
    }
  }

  //delete data
static  Future<int> deleteData(String table, int id) async {
    Database db = await database;
    try {
      return await db.delete(table, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      return await db.delete(table, where: "id = ?", whereArgs: [id]);
      
    }
  }


  static Future<List<Vital>>getAllVitals()async{
    List<Vital> data = [];
          (await Repository.getAllData("Vitals")).forEach((vitalMap) {
            data.add(Vital.vitalMapToObject(vitalMap));
          });

    return data;
  }
}

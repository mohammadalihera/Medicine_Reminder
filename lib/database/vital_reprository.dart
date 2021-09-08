

import 'package:Vitals/database/vital_table.dart';
import 'package:sqflite/sqflite.dart';

class Repository{

  VitalDatabase _vitalDatabase = VitalDatabase();
   late Database _database;

  //init database
  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _vitalDatabase.setDatabase();
    return _database;
  }

  //insert something to database
  Future<int> insertData(String table,Map<String,dynamic> data) async{
    Database db = await database;
    try{
      return await db.insert(table, data);
    }catch(e){
      return await db.insert(table,data);
    }
  }

  //get all data from database
  Future<List<Map<String,dynamic>>> getAllData(table) async{
    Database db = await database;
    try{
      return db.query(table);
    }catch(e){
      return db.query(table);
    }
  }

  //delete data
  Future<int> deleteData(String table,int id) async{
    Database db = await database;
    try{
      return await db.delete(table,where: "id = ?", whereArgs: [id]);
    }catch(e){
      return await db.delete(table,where: "id = ?", whereArgs: [id]);;
    }
  }


}
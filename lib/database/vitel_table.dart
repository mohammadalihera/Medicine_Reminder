import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VitelDatabase {
  VitelDatabase ._privateConstructor();

  static final VitelDatabase  instance = VitelDatabase ._privateConstructor();
  static setDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "vitel_db");
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Vitel (id INTEGER PRIMARY KEY, name TEXT, doseOne TEXT,  doseTwo TEXT, doseThree TEXT, doseFour TEXT, doseFive TEXT, doseSix TEXT, date TEXT, program INTEGER,quantity INTEGER, afterMeal Boolean)");
    });
    return database;
  }
}

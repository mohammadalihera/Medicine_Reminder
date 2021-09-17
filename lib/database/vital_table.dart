import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VitalDatabase {
  VitalDatabase ._privateConstructor();

  static final VitalDatabase  instance = VitalDatabase ._privateConstructor();
  static setDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "vital_db");
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Vitals (id INTEGER PRIMARY KEY, name TEXT, doseOne TEXT,  doseTwo TEXT, doseThree TEXT, doseFour TEXT, doseFive TEXT, doseSix TEXT, date INTEGER, program INTEGER,quantity INTEGER, afterMeal Boolean)");
    });
    return database;
  }
}

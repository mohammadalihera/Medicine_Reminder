import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VitalDatabase {
  setDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "vital_db");
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Vitals INTEGER PRIMARY KEY, name TEXT, doseOne TEXT,  doseTwo TEXT, doseThree TEXT, doseFour TEXT, doseFive TEXT, doseSix TEXT, startDate TEXT, program INTEGER,quantity INTEGER,afterMeal Boolean)");
    });
    return database;
  }
}

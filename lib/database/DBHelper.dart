
import 'dart:async';
import 'dart:io' as io;
import 'package:cs606_sec1/PetRecord.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{

  static Database _db; // singleton

  /// Get the database, or create it if it doesn't exist yet
  Future<Database> get db async {
    if(_db != null)
      return _db;
    // If singleton not yet assigned, then initialize a database and assign it
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "petRecord.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name PetRecord with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE PetRecord(id INTEGER PRIMARY KEY, petName TEXT, petAge BIGINT)");
    print("Created tables");
  }

  // Retrieving pet record from PetRecord Tables
  Future<List<PetRecord>> getPetRecords() async {
    var dbClient = await db;  // Get the singleton database
    List<Map> list = await dbClient.rawQuery('SELECT * FROM PetRecord');
    List<PetRecord> petRecords = [];
    for (int i = 0; i < list.length; i++) {
      Map entry = list[i];
      petRecords.add(new PetRecord(entry["petName"], entry["petAge"]));
    }
    print(petRecords.length);
    return petRecords;
  }

  void savePetRecord(PetRecord petRecord) async {
    var dbClient = await db; // Get the singleton database
    await dbClient.transaction((txn) async {
      String dbQuery = 'INSERT INTO PetRecord(petName, petAge) VALUES(' +
          '\'' +
          petRecord.petName +
          '\',\'' +
          petRecord.petAge.toString() +
          '\'' +
          ')';
      return await txn.rawInsert(dbQuery);
    });
  }


}
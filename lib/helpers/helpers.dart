import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';
class DBHelper{

  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();


  static Database? db;
  final String dbName = 'AnimalFlutter.db';
  final String tableName = 'animal';
  final String colId = 'id';
  final String colName = 'name';
  final String colDescription = 'description';
  final String colCategory = 'category';
  final String colImage = 'image';

  Future<Database?> initDB() async {

    String directory =  await getDatabasesPath();
    String path = join(directory , dbName);

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT,$colDescription TEXT,$colCategory TEXT);";
      await db.execute(query);

    });

    return db;
  }

  Future<int> insertData ({required Animal data}) async {
    db  = await initDB();

    String query = "INSERT INTO $tableName($colName, $colDescription, $colCategory) VALUES(?,?,?);";

    List args = [data.name,data.description,data.category];

    return await db!.rawInsert(query,args);

  }

  Future<List<Animal>> fetchData() async {

    db = await initDB();

    String query = "SELECT * FROM $tableName WHERE $colCategory=?";
    List args = [category];

    List<Map<String,dynamic>> data = await db!.rawQuery(query,args) ;

    List<Animal> allData = data.map((e) => Animal.fromMap(e)).toList();

    return allData;

  }

}
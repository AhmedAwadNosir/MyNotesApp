import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // include join fn

class SqlFliteDb {
  static Database? _db;
  final String notestableName = 'notes';

//for Getting my db if it inizialized if not inzialize it and getit
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intailDB();
      return _db;
    } else {
      return _db;
    }
  }

// for creating my DataBase
  intailDB() async {
    String dbStorageBath = await getDatabasesPath();
    String dbBath = join(dbStorageBath, 'notes.db');
    Database myDb = await openDatabase(dbBath,
        onCreate: _onCreate, version: 0, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE '$notestableName'(
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      description TEXT NOT NULL,
      date TEXT NOT NULL,
      noteColor INTEGER NOT NULL,
      )
      ''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute(
        ''); // write here the code you want to update thing or create new table
    // that fn is called when you change the version
  }

  Future<List<Map<String, dynamic>>> readDatawSql(String sql) async {
    Database? myDb = _db;
    List<Map<String, dynamic>> response = await myDb!.rawQuery(sql);
    return response;
  }

  Future<int> insertDatawSql(String sql) async {
    Database? myDb = _db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  Future<int> updateDatawSql(String sql) async {
    Database? myDb = _db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  Future<int> DeletDatawSql(String sql) async {
    Database? myDb = _db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

// shortcuts to do select,insert,update,delete
  Future<List<Map<String, dynamic>>> readDataw(String tableName) async {
    Database? myDb = _db;
    List<Map<String, dynamic>> response = await myDb!.query(tableName);
    return response;
  }

  Future<int> insertDataw(String tableName, Map<String, dynamic> values) async {
    Database? myDb = _db;
    int response = await myDb!.insert(tableName, values);
    return response;
  }

  Future<int> updateDataw(
      String tableName, Map<String, dynamic> values, String where) async {
    Database? myDb = _db;
    int response = await myDb!.update(tableName, values, where: where);
    return response;
  }

  Future<int> deletData(String tableName, String where) async {
    Database? myDb = _db;
    int response = await myDb!.delete(tableName, where: where);
    return response;
  }
}

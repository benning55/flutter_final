    
import 'package:final_exam/models/Users.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

final String userTable = 'users';
final String colId = 'id';
final String colName = 'name';
final String colUser = 'username';
final String colPass = 'password';

class DatabaseManage {
  static final DatabaseManage _instance = new DatabaseManage.internal();
  factory DatabaseManage() => _instance;
  static Database _database;
  DatabaseManage.internal();

  Future<Database> get db async {
    if(_database != null){
      return _database;
    }else{
      _database = await initDb();
      return _database;
    }
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'users.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
     await db.execute(
        'CREATE TABLE $userTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName VARCHAR(25), $colUser VARCHAR(25), $colPass VARCHAR(25))');
  }

  //insert
  Future<int> createNewUser(Users users) async {
    var dbClient = await db;
    var result = await dbClient.insert(userTable, users.toMap());
    return result;
  }

  //read
  Future<List<Users>> getAllUser() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient.query(userTable,
      columns: [colId, colName, colUser, colPass]);
    return List.generate(result.length, (i) {
      return Users.getValue(result[i]['name'], result[i]['username'], result[i]['password']);
    });
  }

  //get user login
  Future<List<Users>> getLogInUser(String username,String password) async {
      final dbClient = await db;
      final List<Map<String, dynamic>> maps = await dbClient.rawQuery("SELECT * FROM users WHERE username=? and password=?", [username, password]);
      debugPrint(maps.length.toString());
      if(maps.length.toString() == '0'){
        return null;
      }else{
        return List.generate(maps.length, (i){
          return Users.getValue(maps[i]['name'], maps[i]['username'], maps[i]['password']);
        });
      }
  }

  //update
  Future<int> updateUser(Users users) async {
    var dbClient = await db;
    return await dbClient.update(userTable, users.toMap(),
        where: "$colId = ?", whereArgs: [users.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

}
import 'dart:async';
import 'package:alphabets_app/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper
{

  static final DatabaseHelper instance = DatabaseHelper.internal();
  static Database? _database;
  DatabaseHelper.internal();

  Future<Database> get database async
  {
    if (_database!=null)  return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path =  join(dbPath, 'myDataBase.db');
    return await openDatabase(path,version: 1,onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE USERR 
(IDD INTEGER PRIMARY KEY AUTOINCREMENT,
NAMEE VARCHAR(20),
EMAIL VARCHAR(20),
PASSWORD VARCHAR(20),
BIRTHDATE VARCHAR(20)
); 
''');
  }

  Future insertUser(User user) async {
    final db = await instance.database;
    await db.insert("USERR", user.toMap());
  }


  Future<List<User>> getUsers() async {
    final db = await instance.database;
    final userMaps = await db.query("USERR");
    return userMaps.map((json) => User.fromMap(json)).toList();
  }



  Future close() async {
    final db = await instance.database;
    return db.close();
  }



  }

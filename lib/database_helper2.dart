import 'dart:async';
import 'package:alphabets_app/models/alphabet.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper2
{

  static final DatabaseHelper2 instance = DatabaseHelper2.internal();
  static Database? _database;
  DatabaseHelper2.internal();

  Future<Database> get database async
  {
    if (_database!=null)  return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path =  join(dbPath, 'myDataBase2.db');
    return await openDatabase(path,version: 1,onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE ALPHABET ( IDD INTEGER PRIMARY KEY AUTOINCREMENT,"
        "ARABICALPHA VARCHAR(20),"
        "WORDEXAMPLE VARCHAR(20))");
  }

  Future insertAlphabet(Alphabet alphabet) async {
    final db = await instance.database;
    await db.insert("ALPHABET", alphabet.toMap());
  }

  Future<List<Alphabet>> getAlphabets() async {
    final db = await instance.database;
    final alphabetMaps = await db.query("ALPHABET");
    return alphabetMaps.map((json) => Alphabet.fromMap(json)).toList();
  }


  Future close() async {
    final db = await instance.database;
    return db.close();
  }



}
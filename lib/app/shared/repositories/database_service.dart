import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../consts/const_string.dart';
import '../interfaces/database_service_interface.dart';
import '../model/note_model.dart';

class DatabaseService implements IDatabaseService {
  DatabaseService._();
  static final DatabaseService instance = DatabaseService._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await initDatabase();
  }

  @override
  Future<Database> initDatabase() async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';
    final boolType = 'BOOLEAN';
    final pathDb = await getDatabasesPath();
    final dbLocal = join(pathDb, 'note.db');
    return await openDatabase(dbLocal, version: 1,
        onCreate: (db, dbRecentVersion) {
      var sql =
          'CREATE TABLE ${ConstString.pathDoc} (id $idType, title $textType, content $textType, lastAtt $textType, isMarked $boolType)';
      db.execute(sql);
    });
  }

  @override
  Future<void> createNote(NoteModel note) async {
    final db = await instance.database;
    await db.insert(ConstString.pathDoc, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> editNote(NoteModel note) async {
    final db = await instance.database;
    await db.update(
      ConstString.pathDoc,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      ConstString.pathDoc,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<NoteModel>?> fetchNote() async {
    final db = await instance.database;
    final orderBy = 'lastAtt ASC';
    final result = await db.query(ConstString.pathDoc, orderBy: orderBy);
    final resultMap = result.map(NoteModel.fromDoc).toList();
    return resultMap;
  }

  @override
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

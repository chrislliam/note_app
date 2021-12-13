import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../interfaces/database_service_interface.dart';
import '../model/note_model.dart';

class DatabaseService implements IDatabaseService {
  DatabaseService._();
  static final DatabaseService instance = DatabaseService._();

  Database? _database;

  final String _pathDoc = 'notes';
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
          'CREATE TABLE $_pathDoc (id $idType, title $textType, content $textType, lastAtt $textType, isMarked $boolType)';
      db.execute(sql);
    });
  }

  @override
  Future<void> createNote(NoteModel note) async {
    final db = await instance.database;
    await db
        .insert(_pathDoc, note.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .whenComplete(() {
      print('Foi criado');
    });
  }

  @override
  Future<void> editNote(NoteModel note) async {
    final db = await instance.database;
    await db.update(
      _pathDoc,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      _pathDoc,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Stream<List<NoteModel>?> fetchNote() async* {
    final db = await instance.database;
    final orderBy = 'lastAtt ASC';
    final result = await db.query(_pathDoc, orderBy: orderBy);
    final resultMap = result.map(NoteModel.fromDoc).toList();
    yield resultMap;
  }

  @override
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

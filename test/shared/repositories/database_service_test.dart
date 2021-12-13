import 'package:clean_dart/app/shared/model/note_model.dart';
import 'package:clean_dart/app/shared/repositories/database_service.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DatabaseServiceMock implements DatabaseService {
  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<void> createNote(NoteModel note) {
    // TODO: implement createNote
    throw UnimplementedError();
  }

  @override
  // TODO: implement database
  Future<Database> get database => throw UnimplementedError();

  @override
  Future<int> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> editNote(NoteModel note) {
    // TODO: implement editNote
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteModel>?> fetchNote() {
    // TODO: implement fetchNote
    throw UnimplementedError();
  }

  @override
  Future<Database> initDatabase() {
    // TODO: implement initDatabase
    throw UnimplementedError();
  }
}

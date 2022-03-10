import 'package:sqflite/sqflite.dart';

import '../model/note_model.dart';

abstract class IDatabaseService {
  Future<Database> initDatabase();
  Future<void> createNote(NoteModel note);
  Future<List<NoteModel>?> fetchNote();
  Future<void> editNote(NoteModel note);
  Future<int> delete(int id);
  Future close();
}

import 'package:flutter/material.dart';
import '../../../shared/interfaces/database_service_interface.dart';
import '../../../shared/model/note_model.dart';

abstract class IEditNoteStore extends ChangeNotifier {
  IEditNoteStore(IDatabaseService repository);

  bool get isLoading;
  bool get hasError;
  String get error;
  Future<void> getNote();
  Future<void> createNote();
  Future<void> editNote(int id);
  Future<int> delete(int id);
  NoteModel? get note;
}

class EditNoteStore extends ChangeNotifier implements IEditNoteStore {
  late IDatabaseService repository;
  EditNoteStore({required this.repository});

  NoteModel? _noteModel;

  TextEditingController editTitle = TextEditingController();
  TextEditingController editContent = TextEditingController();
  bool isMarked = false;

  String _error = '';

  @override
  String get error => _error;

  @override
  Future<void> getNote() {
    throw UnimplementedError();
  }

  void _setError({String value = ''}) {
    _error = value;
    notifyListeners();
  }

  @override
  Future<void> createNote() async {
    try {
      _noteModel = NoteModel(
        title: editTitle.text,
        content: editContent.text,
        isMarked: isMarked,
        lastAtt: DateTime.now(),
      );
      await repository.createNote(_noteModel!);
    } on Exception catch (e) {
      _setError(value: e.toString());
    }
  }

  @override
  Future<int> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> editNote(int id) async {
    try {
      _noteModel = NoteModel(
        id: id,
        title: editTitle.text,
        content: editContent.text,
        isMarked: isMarked,
        lastAtt: DateTime.now(),
      );
      await repository.editNote(_noteModel!);
    } on Exception catch (e) {
      _setError(value: e.toString());
    }
  }

  @override
  bool get hasError => _error.isNotEmpty;

  @override
  bool get isLoading => throw UnimplementedError();

  @override
  NoteModel? get note => _noteModel;
}

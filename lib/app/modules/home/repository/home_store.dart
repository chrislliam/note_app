import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../../shared/interfaces/database_service_interface.dart';
import '../../../shared/model/note_model.dart';

abstract class IHomeStore extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  String get error;
  Stream<List<NoteModel>?> get fetchList;
  Future<void> deleteNote(int id);
}

class HomeStore extends ChangeNotifier implements IHomeStore {
  final IDatabaseService repository;

  HomeStore({required this.repository});
  bool _isLoading = false;

  String _error = '';

  void _setIsLoading({bool value = false}) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError({String value = ''}) {
    _error = value;
    notifyListeners();
  }

  @override
  String get error => _error;

  @override
  Stream<List<NoteModel>?> get fetchList {
    try {
      _setIsLoading(value: true);
      return repository.fetchNote();
    } finally {
      _setIsLoading();
    }
  }

  @override
  bool get hasError => _error.isNotEmpty;

  @override
  bool get isLoading => _isLoading;

  @override
  Future<void> deleteNote(int id) async {
    await repository.delete(id).whenComplete(() => print('deletou'));
  }
}

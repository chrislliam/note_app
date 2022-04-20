import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../../shared/interfaces/database_service_interface.dart';
import '../../../shared/model/note_model.dart';

abstract class HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final List<NoteModel>? list;

  Loaded(this.list);
}

class Error extends HomeState {
  final String errorMessage;

  Error(this.errorMessage);
}

class HomeStore extends ValueNotifier<HomeState> {
  final IDatabaseService repository;

  HomeStore({required this.repository}) : super(Loading());

  Future<void> fetchList() async {
    value = Loading();
    try {
      repository.fetchNote().then((list) {
        value = Loaded(list);
      });
    } catch (e) {
      value = Error(e.toString());
    }
  }

  Future<void> deleteNote(int id) async {
    await repository.delete(id).whenComplete(() => print('deletou'));
    notifyListeners();
  }
}

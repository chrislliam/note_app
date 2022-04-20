import 'package:flutter/material.dart';

import '../../../shared/consts/routes_const.dart';
import '../../../shared/model/tuple_note.dart';
import '../../../shared/widgets/error_widget.dart';
import '../controller/home_store.dart';
import 'card_note.dart';

class HomeBody extends StatefulWidget {
  final HomeStore store;

  const HomeBody({Key? key, required this.store}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
        valueListenable: widget.store,
        builder: (context, value, __) {
          switch (value.runtimeType) {
            case Loading:
              return Center(child: CircularProgressIndicator());
            case Error:
              var valueError = value as Error;
              return HandleError(
                error: valueError.errorMessage,
                onRefresh: () => widget.store.fetchList(),
              );

            case Loaded:
              var newValue = value as Loaded;
              if (newValue.list!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Lista vazia'),
                      IconButton(
                          onPressed: () => widget.store.fetchList(),
                          icon: Icon(Icons.refresh))
                    ],
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.all(16),
                  child: RefreshIndicator(
                    onRefresh: () => widget.store.fetchList(),
                    child: ListView.builder(
                        itemCount: newValue.list!.length,
                        itemBuilder: (_, index) {
                          var note = newValue.list![index];
                          return NoteCardWidget(
                              note: note,
                              edit: () async => await Navigator.pushNamed(
                                  context, RoutesConst.editNote,
                                  arguments:
                                      TupleNote(isEdit: true, note: note)),
                              delete: () => widget.store.deleteNote(note.id!));
                        }),
                  ),
                );
              }
            default:
              return Center(
                  child: GestureDetector(
                      onTap: () => widget.store.fetchList(),
                      child: const Text('Recarregar')));
          }
        });
  }
}

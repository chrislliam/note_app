import 'package:flutter/material.dart';

import '../../../shared/consts/routes_const.dart';
import '../../../shared/model/note_model.dart';
import '../../../shared/model/tuple_note.dart';
import '../../../shared/widgets/error_widget.dart';
import '../controller/home_store.dart';
import 'card_note.dart';

class HomeBody extends StatefulWidget {
  final IHomeStore store;

  const HomeBody({Key? key, required this.store}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.store.fetchList,
        builder: (context, snapshot) {
          if (widget.store.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (widget.store.hasError) {
            return HandleError(
              error: widget.store.error,
              onRefresh: () => widget.store.fetchList,
            );
          } else {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              var list = snapshot.data as List<NoteModel>;
              if (list.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Lista vazia'),
                      IconButton(
                          onPressed: () => widget.store.fetchList,
                          icon: Icon(Icons.refresh))
                    ],
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.all(16),
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        var note = list[index];
                        return NoteCardWidget(
                            note: note,
                            edit: () async {
                              await Navigator.pushNamed(
                                  context, RoutesConst.editNote,
                                  arguments:
                                      TupleNote(isEdit: true, note: note));
                              setState(() {});
                            },
                            delete: () {
                              widget.store.deleteNote(note.id!);
                              setState(() {});
                            });
                      }),
                );
              }
            }
          }
        });
  }
}

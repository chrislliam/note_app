import 'package:flutter/material.dart';
import '../../shared/consts/icons_const.dart';
import '../../shared/interfaces/database_service_interface.dart';

import '../../shared/model/tuple_note.dart';
import 'repository/edit_note_store.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({
    Key? key,
    required this.tuple,
    required this.repository,
  }) : super(key: key);
  final TupleNote tuple;

  final IDatabaseService repository;
  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late EditNoteStore store;
  @override
  void initState() {
    store = EditNoteStore(repository: widget.repository);
    if (widget.tuple.isEdit == true) {
      store.editContent.text = widget.tuple.note!.content!;
      store.editTitle.text = widget.tuple.note!.title!;
      store.isMarked = widget.tuple.note!.isMarked;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  store.isMarked = !store.isMarked;
                });
              },
              icon: Icon(store.isMarked
                  ? IconsConst.isMarked
                  : IconsConst.isNotMarked))
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                TextField(
                  controller: store.editTitle,
                  style: Theme.of(context).textTheme.headline6,
                  autofocus: true,
                  decoration: InputDecoration.collapsed(hintText: 'Título'),
                ),
                SizedBox(
                  height: 72,
                ),
                TextField(
                  controller: store.editContent,
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration.collapsed(hintText: 'Conteúdo'),
                ),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.tuple.isEdit ? 'Editado' : 'Novo',
                    style: Theme.of(context).textTheme.subtitle1),
                TextButton(
                    child: Text('Salvo'),
                    onPressed: widget.tuple.isEdit
                        ? () => store
                            .editNote(widget.tuple.note!.id!)
                            .then((_) => Navigator.pop(context))
                        : () => store
                            .createNote()
                            .then((_) => Navigator.pop(context)))
              ],
            )
          ],
        ),
      ),
    );
  }
}

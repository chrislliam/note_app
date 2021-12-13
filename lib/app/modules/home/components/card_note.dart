import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../shared/consts/routes_const.dart';
import '../../../shared/model/note_model.dart';
import '../../../shared/model/tuple_note.dart';

Widget noteCard(BuildContext context,
    {required NoteModel note, void Function()? onPressed}) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: .4,
          color: Theme.of(context).hoverColor,
        )),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 2),
          child:
              Text(note.title!, style: Theme.of(context).textTheme.headline6),
        ),
        Text(note.content!, style: Theme.of(context).textTheme.bodyText2),
        Row(
          children: [
            Text(
              DateFormat.MMMd('pt_Br').format(note.lastAtt),
              style: Theme.of(context).textTheme.caption,
            ),
            Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.delete),
              iconSize: 21,
              color: Theme.of(context).hoverColor,
            ),
            IconButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, RoutesConst.editNote,
                      arguments: TupleNote(isEdit: true, note: note));
                },
                icon: Icon(Icons.edit),
                iconSize: 21,
                color: Theme.of(context).hoverColor)
          ],
        )
      ],
    ),
  );
}

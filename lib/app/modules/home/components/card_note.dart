import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../shared/model/note_model.dart';

class NoteCardWidget extends StatefulWidget {
  final NoteModel note;
  final void Function() delete;
  final void Function() edit;
  const NoteCardWidget({
    Key? key,
    required this.note,
    required this.delete,
    required this.edit,
  }) : super(key: key);

  @override
  State<NoteCardWidget> createState() => _NoteCardWidgetState();
}

class _NoteCardWidgetState extends State<NoteCardWidget> {
  @override
  Widget build(BuildContext context) {
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
            child: Text(widget.note.title!,
                style: Theme.of(context).textTheme.headline6),
          ),
          Text(widget.note.content!,
              style: Theme.of(context).textTheme.bodyText2),
          Row(
            children: [
              Text(
                DateFormat.MMMd('pt_Br').format(widget.note.lastAtt),
                style: Theme.of(context).textTheme.caption,
              ),
              Spacer(),
              IconButton(
                onPressed: widget.delete,
                icon: Icon(Icons.delete),
                iconSize: 21,
                color: Theme.of(context).hoverColor,
              ),
              IconButton(
                  onPressed: widget.edit,
                  icon: Icon(Icons.edit),
                  iconSize: 21,
                  color: Theme.of(context).hoverColor)
            ],
          )
        ],
      ),
    );
  }
}

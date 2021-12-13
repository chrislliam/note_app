import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_store.dart';
import '../../shared/consts/routes_const.dart';
import '../../shared/interfaces/database_service_interface.dart';
import '../../shared/interfaces/shared_repository_interface.dart';
import '../../shared/model/note_model.dart';
import '../../shared/model/tuple_note.dart';
import '../../shared/widgets/error_widget.dart';
import 'components/card_note.dart';
import 'repository/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.repository,
    required this.sharedRepository,
  }) : super(key: key);

  final IDatabaseService repository;
  final ISharedRepository sharedRepository;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var store = HomeStore(repository: widget.repository)..fetchList;

    return Consumer<AppStore>(builder: (context, appstore, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('To do list'),
          actions: [
            Center(child: Text('Mudar tema')),
            Switch(
                activeColor: Theme.of(context).highlightColor,
                value: appstore.isDark,
                onChanged: (value) {
                  appstore.switchTheme;
                }),
          ],
        ),
        body: StreamBuilder(
            stream: store.fetchList,
            builder: (context, snapshot) {
              if (store.isLoading) {
                return LinearProgressIndicator();
              } else if (store.hasError) {
                return HandleError(
                  error: store.error,
                  onRefresh: () => store.fetchList,
                );
              } else {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var list = snapshot.data as List<NoteModel>;
                  if (list.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          Text('Tem nada'),
                          IconButton(
                              onPressed: () => store.fetchList,
                              icon: Icon(Icons.refresh))
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.all(16),
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 6.0,
                          runSpacing: 12.0,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: list.map((note) {
                            return noteCard(context,
                                note: note,
                                onPressed: () => store.deleteNote(note.id!));
                          }).toList()),
                    );
                  }
                }
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, RoutesConst.editNote,
                arguments: TupleNote(isEdit: false));
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}

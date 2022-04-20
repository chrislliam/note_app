import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_store.dart';
import '../../shared/consts/routes_const.dart';
import '../../shared/interfaces/database_service_interface.dart';
import '../../shared/model/tuple_note.dart';
import '../../shared/repositories/database_service.dart';
import 'components/home_body.dart';
import 'controller/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final IDatabaseService repository;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore store;
  @override
  void initState() {
    store = HomeStore(repository: DatabaseService.instance);
    WidgetsBinding.instance
        ?.addPostFrameCallback((timeStamp) => store.fetchList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To do list'), actions: [
        Center(child: Text('Mudar tema')),
        Consumer<AppStore>(builder: (_, appstore, child) {
          return Switch(
              activeColor: Theme.of(context).highlightColor,
              value: appstore.isDark,
              onChanged: (value) {
                appstore.switchTheme;
              });
        })
      ]),
      body: HomeBody(store: store),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await Navigator.pushNamed(
            context, RoutesConst.editNote,
            arguments: TupleNote(isEdit: false)),
        child: Icon(Icons.add, color: Theme.of(context).backgroundColor),
      ),
    );
  }
}

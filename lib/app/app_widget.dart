import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'app_store.dart';
import 'shared/consts/routes_const.dart';
import 'shared/repositories/shared_repository.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppStore store = AppStore(sharedRepository: SharedRepository());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => store,
      child: Consumer<AppStore>(builder: (context, appstore, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Note',
          theme: appstore.themeApp.getTheme(),
          themeMode: appstore.themeMode,
          initialRoute: Routes.initialRoute,
          onGenerateRoute: Routes.generateRoutes,
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        );
      }),
    );
  }
}

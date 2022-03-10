import 'package:flutter/material.dart';
import '../../modules/edit_note/edit_note_page.dart';
import '../../modules/home/home_page.dart';
import '../../shared/repositories/database_service.dart';

mixin Routes {
  static String get initialRoute => RoutesConst.initial;

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    RoutesConst.initial: (_, args) => HomePage(
          repository: DatabaseService.instance,
        ),
    RoutesConst.editNote: (_, args) => EditNotePage(
          tuple: args,
          repository: DatabaseService.instance,
        ),
  };
  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}

class RoutesConst {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String editNote = '/editNote';
  static const String editProfile = '/editProfile';
}

import 'package:flutter/material.dart';

import '../consts/const_string.dart';
import '../interfaces/shared_repository_interface.dart';
import '../local_storage.dart';

class SharedRepository implements ISharedRepository {
  @override
  Future<ThemeMode> readThemeMode() async {
    return await LocalStorage.getValue<String>(ConstString.constThemeMode)
        .then((value) {
      switch (value) {
        case ConstString.constThemeModeDark:
          return ThemeMode.dark;
        case ConstString.constThemeModeLight:
          return ThemeMode.light;
        default:
          return ThemeMode.light;
      }
    });
  }

  @override
  String readUserInfo() {
    return '';
  }

  @override
  Future<bool> saveThemeMode(ThemeMode themeMode) async {
    print('$themeMode');
    return await LocalStorage.setValue<String>(
        ConstString.constThemeMode, themeMode.toString());
  }

  @override
  void saveUserInfo(String userInfo) {
    return null;
  }
}

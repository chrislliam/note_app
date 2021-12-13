import 'package:flutter/material.dart';

abstract class ISharedRepository {
  String readUserInfo();
  void saveUserInfo(String userInfo);
  Future<ThemeMode> readThemeMode();
  Future<bool> saveThemeMode(ThemeMode themeMode);
}

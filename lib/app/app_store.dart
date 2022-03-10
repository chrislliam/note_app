import 'package:flutter/material.dart';
import 'shared/features/theme/app_theme_factory.dart';
import 'shared/interfaces/shared_repository_interface.dart';
import 'shared/interfaces/theme_app_interface.dart';

abstract class IAppStore extends ChangeNotifier {
  IAppStore(ISharedRepository sharedRepository);

  ThemeMode get themeMode;
  IThemeAppInterface get themeApp;
  Future<void> get switchTheme;
  Future<void> get loadThemeData;
}

class AppStore extends ChangeNotifier implements IAppStore {
  final ISharedRepository sharedRepository;
  AppStore({required this.sharedRepository}) {
    defaultTheme;
    loadThemeData;
  }
  bool isDark = false;

  @override
  IThemeAppInterface themeApp = AppThemeFactory.getTheme(ThemeMode.light);

  @override
  ThemeMode themeMode = ThemeMode.light;

  @override
  Future<void> get loadThemeData async {
    await sharedRepository.readThemeMode().then(
      (mode) {
        themeMode = mode;
        themeApp = AppThemeFactory.getTheme(mode);
        setThemeData(mode, saveShared: false);
      },
    );
    notifyListeners();
  }

  Future<void> defaultTheme() async {
    final theme = themeMode;
    if (theme == ThemeMode.dark) {
      isDark = true;
    } else {
      isDark = false;
    }
  }

  Future<void> setThemeData(ThemeMode themeMode,
      {bool saveShared = true}) async {
    themeApp = AppThemeFactory.getTheme(themeMode);
    if (saveShared) {
      await sharedRepository.saveThemeMode(themeMode);
    }
    notifyListeners();
  }

  @override
  Future<void> get switchTheme async {
    isDark = !isDark;
    isDark ? setThemeData(ThemeMode.dark) : setThemeData(ThemeMode.light);
    notifyListeners();
  }
}

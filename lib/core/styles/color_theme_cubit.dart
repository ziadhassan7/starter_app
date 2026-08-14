import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../hive/app_settings_local_data_source.dart';


class ThemeCubit extends Cubit<ThemeMode>{

  static final AppSettingsLocalDataSource _dataSource = AppSettingsLocalDataSource();

  ThemeCubit() : super(_getDefaultColor());

  // set the theme
  void setTheme(ThemeMode themeMode){
    _dataSource.setThemeMode(themeMode.name);

    emit(themeMode);
  }

  // get current/default theme
  static ThemeMode _getDefaultColor(){

    String currentThemeString = _dataSource.getTheme()
        ?? ThemeMode.light.name; // default is LightMode

    return ThemeMode.values.byName(currentThemeString);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_shared_pref.dart';


class ThemeCubit extends Cubit<bool>{
  ThemeCubit() : super(getDefaultColor()); //light theme

  static bool getDefaultColor(){
    return ThemePref.getTheme();
  }

  void toggleTheme() {
    bool isDark = ThemePref.getTheme();

    ThemePref.updateTheme(!isDark);
    emit(!isDark);
  }

  void switchThemeTo({required bool isDark}){
    ThemePref.updateTheme(isDark);
    emit(isDark);
  }
}

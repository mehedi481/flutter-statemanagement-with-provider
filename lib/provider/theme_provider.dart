import 'package:flutter/material.dart';
class ThemeProvider with ChangeNotifier{
  String currentTheme = "system";

  ThemeMode get themeMode{
    if(currentTheme == 'light'){
      return ThemeMode.light;
    }else if(currentTheme == 'dark'){
      return ThemeMode.dark;
    }else{
      return ThemeMode.system;
    }
  }

  void changeTheme(String theme){
    currentTheme = theme;
    notifyListeners();
  }
}
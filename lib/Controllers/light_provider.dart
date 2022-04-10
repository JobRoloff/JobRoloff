
import 'package:carapp/light_preferences.dart';
import 'package:flutter/material.dart';

class LightProvider extends ChangeNotifier{
  bool _isDark = false;
  bool get isDark => _isDark;

  Future flipLightSwitch(bool b) async{
    _isDark = b;
    await LightPreferences.setLightPref(b);
    notifyListeners();
  }
}
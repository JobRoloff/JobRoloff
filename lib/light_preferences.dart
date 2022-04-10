
import 'package:shared_preferences/shared_preferences.dart';

class LightPreferences {
  static SharedPreferences? prefs;


  static const  _keyBool = 'kbval';
  
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setLightPref(bool b) async =>
    prefs!.setBool(_keyBool, b);
  

  static bool? getLightPref() =>
    prefs!.getBool(_keyBool);
  

}
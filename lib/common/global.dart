import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static SharedPreferences _sharedPreferences;
  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}

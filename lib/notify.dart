import 'package:flutter/material.dart';

class DarkMode with ChangeNotifier {
  bool darkMode = true; ///by default it is true
  ///made a method which will execute while switching
  changemode() {
    darkMode = !darkMode;
    notifyListeners(); ///notify the value or update the widget value
  }
}

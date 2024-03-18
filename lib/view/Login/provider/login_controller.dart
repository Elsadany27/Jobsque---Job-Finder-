import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login with ChangeNotifier {
  bool obs_text = true;
  String? usernamel;

  showpass() {
    obs_text = !obs_text;
    notifyListeners();
  }

  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }
  chexkname() {
    if (usernamel == null) {
      return "error";
    }
    else {
      return usernamel;
    }
  }
}

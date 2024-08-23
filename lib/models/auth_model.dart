import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  String _username = '';
  String _password = '';

  String get username => _username;
  String get password => _password;

  set username(String value) {
    _username = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  bool login() {
    // Add real authentication logic here
    if (_username == 'admin' && _password == 'admin') {
      return true;
    }
    return false;
  }
}

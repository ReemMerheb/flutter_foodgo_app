import 'package:flutter/material.dart';

class UserProfile with ChangeNotifier {
  String _name;
  String _email;
  String _address;
  String _password;

  UserProfile({
    required String name,
    required String email,
    required String address,
    required String password,
  })  : _name = name,
        _email = email,
        _address = address,
        _password = password;

  
  String get name => _name;
  String get email => _email;
  String get address => _address;
  String get password => _password;

  
  void updateProfile({
    required String name,
    required String email,
    required String address,
    required String password,
  }) {
    _name = name;
    _email = email;
    _address = address;
    _password = password;

    
    notifyListeners();
  }
}

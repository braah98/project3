import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _phone = '';
  String _profilePhoto = '';

  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get profilePhoto => _profilePhoto;

  void updateUser({
    String? name,
    String? email,
    String? phone,
    String? profilePhoto,
  }) {
    _name = name ?? _name;
    _email = email ?? _email;
    _phone = phone ?? _phone;
    _profilePhoto = profilePhoto ?? _profilePhoto;
    notifyListeners();
  }
}
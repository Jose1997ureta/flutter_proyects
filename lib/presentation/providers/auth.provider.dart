// class Auth
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _token = '';

  bool get isLoggedIn => _isLoggedIn;
  String get token => _token;

  // Future<void> validateIsAuth() async {
  //   await Future.delayed(const Duration(seconds: 2));

  //   final pref = await SharedPreferences.getInstance();
  //   pref.getString("token");
  //   pref.getString("userName");
  //   pref.getString("email");
  //   pref.getBool("isLoggedIn");
  // }

  Future<void> login(String email, String password) async {
    if (email == "jose@gmail.com" && password == "123456") {
      _isLoggedIn = true;
      _token = "jose123456";

      // final pref = await SharedPreferences.getInstance();

      // await pref.setString("token", _token);
      // await pref.setString("userName", "Jose");
      // await pref.setString("email", "jose@gmail.com");
      // await pref.setBool("isLoggedIn", true);

      notifyListeners();
    } else {
      throw Exception("Credenciales incorrectas");
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _token = '';
    notifyListeners();
  }
}

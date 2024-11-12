import 'package:ezzeldeen_0522029/Model/Projcet_model.dart';
import 'package:ezzeldeen_0522029/Service/Login_Service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  RegisterModel? model;
  String? error;

  RegisterModel? get loginModel => model;
  String? get errorMessage => error;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      model = await LoginService.login(email: email, password: password);
      if (model != null) {
        notifyListeners();
      } else {
        error = 'Login failed';
        notifyListeners();
      }
    } catch (e) {
      error = 'Error: $e';
      notifyListeners();
    }
  }
}
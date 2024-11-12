import 'package:ezzeldeen_0522029/Model/Projcet_model.dart';
import 'package:ezzeldeen_0522029/Service/Signup_Service.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  RegisterModel? model;
  String? error;

  RegisterModel? get registerModel => model;
  String? get Errorma => error;

  Future<void> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      model = await SignupService.signup(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );
      if (model != null) {
        notifyListeners();
      } else {
        error = 'sing failed';
        notifyListeners();
      }
    } catch (e) {
      error = 'Error: $e';
      notifyListeners();
    }
  }
}
import 'package:dio/dio.dart';
import 'package:ezzeldeen_0522029/Model/Projcet_model.dart';

class LoginService {
  static final Dio _dio = Dio();

  static Future<RegisterModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'https://student.valuxapps.com/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return RegisterModel.fromjson(response.data);
      } else {
        print('Login failed : ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error login: $e');
      return null;
    }
  }
}
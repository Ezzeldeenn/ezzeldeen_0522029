import 'package:dio/dio.dart';
import 'package:ezzeldeen_0522029/Model/Projcet_model.dart';

class SignupService {
  static final Dio _dio = Dio();

  static Future<RegisterModel?> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'https://student.valuxapps.com/api/register',
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return RegisterModel.fromjson(response.data);
      } else {
        print('Signup failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error  signup: $e');
      return null;
    }
  }
}
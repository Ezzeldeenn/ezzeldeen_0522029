import 'package:dio/dio.dart';
import 'package:ezzeldeen_0522029/Model/products_model.dart';

class ItemService {
  static final Dio _dio = Dio();

  static Future<List<ProduModel>> getdata() async {
    try {
      Response response = await _dio.get('https://student.valuxapps.com/api/home');
      if (response.statusCode == 200) {
        print('Response data: ${response.data}');
        List<dynamic> data = response.data['products'];
        return data.map((json) => ProduModel.fromJson(json)).toList();
      } else {
        print('Error fetching: ${response.statusCode}');
        throw Exception("Not found");
      }
    } catch (e) {
      print('Error getting data: $e');
      throw Exception("There is no data");
    }
  }
}

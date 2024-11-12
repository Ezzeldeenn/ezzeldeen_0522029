import 'package:dio/dio.dart';
import 'package:ezzeldeen_0522029/Model/products_model.dart';

class ProductService
{
  static Dio dio =Dio();
  static getProduct () async
  {
    try
    {
      Response response = await dio.get("https://student.valuxapps.com/api/home");
      if(response.statusCode==200)
      {
        return ProductModel.ConvertFromJson (response.data);
      }
      else
      {
        throw Exception("Code Not Success");
      }
    }
    catch(e)
    {
      throw Exception(e);
    }
  }
}
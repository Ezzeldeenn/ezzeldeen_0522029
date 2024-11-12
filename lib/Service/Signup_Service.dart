import 'package:dio/dio.dart';
import 'package:ezzeldeen_0522029/Model/Projcet_model.dart';

class RegistrationServices
{
  static Dio dio = Dio();
  static RegistrationModel? registrationModel;

  static Future <RegistrationModel> signup ({ required String name ,required String phone ,required String email ,required String password} ) async
  {
    try
    {
      Response response  = await dio.post("https://student.valuxapps.com/api/register",
          data:
          {
            'name': name ,
            'phone' : phone,
            'email' : email,
            'password' : password ,
          });
      if(response.statusCode==200)
      {
        print(response.data);
        return RegistrationModel.ConvertFromJson (response.data);
      }
      else
      {
        throw Exception("You Have An Error");
      }
    }
    catch(e)
    {
      throw Exception(e);
    }
  }


  static Future<RegistrationModel> login ({required String email , required String password} ) async
  {
    try
    {
      Response response  = await dio.post("https://student.valuxapps.com/api/login",
          data:
          {
            'email' : email,
            'password' : password ,
          });
      if(response.statusCode==200)
      {
        print(response.data);
        return RegistrationModel.ConvertFromJson (response.data);
      }
      else
      {
        throw Exception("You Have An Error");
      }
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

}

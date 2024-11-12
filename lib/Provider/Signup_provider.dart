import 'package:ezzeldeen_0522029/Model/Projcet_model.dart';
import 'package:ezzeldeen_0522029/Service/Signup_Service.dart';
import 'package:flutter/material.dart';



class RegisteProvider extends ChangeNotifier
{
  RegistrationModel ? registrationModel;

  Future<bool> signupProvider (String name , String phone , String email , String password) async
  {
    try
    {
      registrationModel = await RegistrationServices.signup(name: name, phone: phone,email: email,password: password);
      if(registrationModel?.status==true)
      {
        notifyListeners();
        return true;
      }
      else
      {
        return false ;
      }
    }
    catch(e)
    {
      print("the error isss  $e");
      return false;
    }
  }

  Future<bool> loginProvider ( String email , String password) async
  {
    try
    {
      registrationModel = await RegistrationServices.login(email: email,password: password);
      if(registrationModel?.status == true)
      {
        notifyListeners();
        return true;
      }
      else
      {
        throw Exception("the Status is False ");
      }
    }
    catch(e)
    {
      print(e);
      return false;
    }
  }



}
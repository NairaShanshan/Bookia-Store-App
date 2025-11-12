import 'package:bookia_store_app/core/services/api_endpoints.dart';
import 'package:bookia_store_app/core/services/dio_provider.dart';

import '../models/requests/auth_params.dart';
import 'dart:developer';

import '../models/response/auth-response.dart';

class AuthRepo {

  static Future<AuthResponse?> register(AuthParameters params) async {
    try {
      var res = await DioProvider.post(
        endPoint: EndPoints.register,
        data: params.toJson(), // convert map to json
      );

      if (res.statusCode == 201) {   // if res.statusCode == 201 will give error
        //parse json to object

        return AuthResponse.fromJson(res.data) ;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null;
    }
  }



  static Future<AuthResponse?> login(AuthParameters params) async{
     try {
       var res = await DioProvider.post(endPoint: EndPoints.login , data: params.toJson()) ;
       if(res.statusCode == 200) {
         //return model
         return AuthResponse.fromJson(res.data) ;
       }else{
         return null ;
       }
     } on Exception catch (e) {

       log(e.toString()) ;
       return null;
     }
  }


  static Future<AuthResponse?> forgetPassword(AuthParameters params) async{
    try {
      var res = await DioProvider.post(endPoint: EndPoints.forgetPassword , data: params.toJson()) ;
      if(res.statusCode == 200) {
        //return model
        return AuthResponse.fromJson(res.data) ;
      }else{
        return null ;
      }
    } on Exception catch (e) {

      log(e.toString()) ;
      return null;
    }
  }





// i did my account => naira , nairashanshan44@gmail.com , 12345678











}



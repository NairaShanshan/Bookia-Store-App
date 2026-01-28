import 'package:bookia_store_app/core/services/api/api_endpoints.dart';
import 'package:bookia_store_app/core/services/api/dio_provider.dart';
import 'package:bookia_store_app/core/services/local/shared_pref.dart';

import '../models/requests/auth_params.dart';
import 'dart:developer';

import '../models/response/auth-response.dart';
import '../models/response/logout_response_model.dart';

class AuthRepo {

  static Future<AuthResponse?> register(AuthParameters params) async {
    try {
      var res = await DioProvider.post(
        endPoint: EndPoints.register,
        data: params.toJson(), // convert map to json
      );

      if (res.statusCode == 201) {   // if res.statusCode == 201 will give error
        //parse json to object

        var data = AuthResponse.fromJson(res.data) ;
        SharedPref.saveToken(data.data?.token) ;
        SharedPref.setUserData(data.data?.user);
        return data ;
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
         var data = AuthResponse.fromJson(res.data);
         // cache token
         SharedPref.saveToken(data.data?.token);
         SharedPref.setUserData(data.data?.user);
         return data;
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



  static Future<LogoutResponse ?> logout()async{
    try {
      var res=await DioProvider.post(endPoint: EndPoints.logout , headers: {
        'Authorization': "Bearer ${SharedPref.getToken()}",

      }) ;

      if(res.statusCode == 200){
        final logoutResponse = LogoutResponse.fromJson(res.data);

        SharedPref.removeToken() ;

        return logoutResponse;

      }else{
        return null ;
      }
    } on Exception catch (e) {
     log(e.toString()) ;
     return null ;
    }
  }

















}



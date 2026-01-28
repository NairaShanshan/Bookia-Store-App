import 'dart:developer';

import 'package:bookia_store_app/core/services/api/api_endpoints.dart';
import 'package:bookia_store_app/core/services/api/dio_provider.dart';


import '../../../../core/services/local/shared_pref.dart';
import '../models/cart_response/cart_response.dart';
import '../models/requests/place_order_params.dart';

class CartRepo {

  static Future<CartResponse?> getCart() async{
    try {
      var res = await DioProvider.get(endPoint: EndPoints.cart ,headers: {
      'Authorization': "Bearer ${SharedPref.getToken()}",
      } ) ;

      if(res.statusCode == 200 ) {
        return CartResponse.fromJson(res.data) ;
      }else{
        return null ;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null ;
    }



  }


  static Future<CartResponse?> addToCart({required int id })async{

    try {
      var res =await DioProvider.post(endPoint: EndPoints.addToCart , headers: {
        'Authorization': "Bearer ${SharedPref.getToken()}",
      } , data:  {
        "product_id" : id ,
      }) ;

      if(res.statusCode == 201) {
        return CartResponse.fromJson(res.data) ;
      }else{
        return null ;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null ;
    }
  }

  static Future<CartResponse?> removeFromCart({required int id })async{

    try {
      var res =await DioProvider.post(endPoint: EndPoints.removeFromCart , headers: {
        'Authorization': "Bearer ${SharedPref.getToken()}",
      } , data:  {
        "cart_item_id" : id ,
      }) ;

      if(res.statusCode == 200) {
        return CartResponse.fromJson(res.data) ;
      }else{
        return null ;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null ;
    }
  }

  
  static Future<CartResponse?> updateCart({required int  cartItemId , required int itemQuantity}) async{
    
    try {
      var res =await  DioProvider.post(endPoint: EndPoints.updateCart , data: {
        'cart_item_id' : cartItemId ,
        'quantity' : itemQuantity ,
      } ,
      headers: {
        'Authorization': "Bearer ${SharedPref.getToken()}",
      }) ;

      if(res.statusCode == 201) {
        return CartResponse.fromJson(res.data) ;
      }else{
        return null ;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null ;
    }

  }



  static Future<bool> checkout() async{
    try {
      var res = await DioProvider.get(endPoint: EndPoints.checkout ,
      headers: {
        'Authorization': "Bearer ${SharedPref.getToken()}",
      }) ;

      if(res.statusCode == 200){
        return true ;
      }else{
        return false ;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false ;
    }
  }


  static Future<bool> placeOrder(PlaceOrderParams params)async {
    try {
      var res = await DioProvider.post(endPoint: EndPoints.placeOrder ,
      headers: {
        'Authorization': "Bearer ${SharedPref.getToken()}",
      } , data: params.toJson()) ;

      if(res.statusCode == 201) {
        return true ;
      }else{
        return false ;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false ;
    }
  }








}
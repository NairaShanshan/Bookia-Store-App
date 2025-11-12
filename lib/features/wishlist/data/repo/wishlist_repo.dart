import 'dart:developer';

import 'package:bookia_store_app/core/services/api_endpoints.dart';
import 'package:bookia_store_app/core/services/dio_provider.dart';

import '../models/wishlist_response.dart';

class WishListRepo {

  static Future<WishlistResponse?> getWishlist() async{
    try {
      var  res =await DioProvider.get(endPoint: EndPoints.wishList ,
        headers: {
        'Authorization' : 'Bearer 10412|yBqz6WJNwFnpyNCqdCpJ5yr4zd3OVuJThRZLbpTf' ,
        }
      ) ;
      if(res.statusCode == 200 ) {
        return WishlistResponse.fromJson(res.data) ;

      }else {
        return null ;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null;
    }

  }


  static Future<WishlistResponse?> addToWishList({required int id}) async{
    try {
      var res =await DioProvider.post(endPoint: EndPoints.addToWishList , headers: {
        'Authorization' : 'Bearer 10412|yBqz6WJNwFnpyNCqdCpJ5yr4zd3OVuJThRZLbpTf'
      } , data: {
        'product_id' : id
      }) ;

      if(res.statusCode == 200) {
        return WishlistResponse.fromJson(res.data) ;
      }else{
        return null ;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null ;
    }
  }




  static Future<WishlistResponse?> removeFromWishList({required int id }) async{
    try {
      var res = await DioProvider.post(endPoint: EndPoints.removeFromWishList , data: {
        'product_id'  : id
      } , headers: {
        'Authorization' : 'Bearer 10412|yBqz6WJNwFnpyNCqdCpJ5yr4zd3OVuJThRZLbpTf' ,
      }) ;

      if(res.statusCode == 200) {
        return WishlistResponse.fromJson(res.data) ;
      }else{
        return null ;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null;
    }


  }



}
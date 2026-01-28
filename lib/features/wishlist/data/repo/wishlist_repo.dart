import 'dart:developer';

import 'package:bookia_store_app/core/services/api/api_endpoints.dart';
import 'package:bookia_store_app/core/services/api/dio_provider.dart';

import '../../../../core/services/local/shared_pref.dart';
import '../models/wishlist_response.dart';

class WishListRepo {

  static Future<WishlistResponse?> getWishlist() async{
    try {
      var  res =await DioProvider.get(endPoint: EndPoints.wishList ,
        headers: {
          'Authorization': "Bearer ${SharedPref.getToken()}",
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
        'Authorization': "Bearer ${SharedPref.getToken()}",
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
        'Authorization': "Bearer ${SharedPref.getToken()}",
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
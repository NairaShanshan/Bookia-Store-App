import 'dart:developer';

import 'package:bookia_store_app/core/services/api_endpoints.dart';
import 'package:bookia_store_app/core/services/dio_provider.dart';
import 'package:bookia_store_app/features/home/data/models/response/best_seller_response/BestSellerResponse.dart';
import 'package:bookia_store_app/features/home/data/models/response/slider_response/slider_model.dart';

class HomeRepo {

  static Future<SliderResponse?> getSlider()async{
    try {
      var res  =await  DioProvider.get(endPoint: EndPoints.slider) ;
      if(res.statusCode == 200) {
        return SliderResponse.fromJson(res.data) ;
      }else {
        return null ;
      }
    } on Exception catch (e) {
      log(e.toString()) ;
      return null ;
    }
  }

  static Future<BestSellerResponse ?> getBestSeller() async {
    try {
      var res =await DioProvider.get(endPoint: EndPoints.productBestSeller) ;
      if(res.statusCode == 200 ) {
        return BestSellerResponse.fromJson(res.data) ;
      }else{
         return null ;
        }
    } on Exception catch (e) {
     log(e.toString()) ;
     return null ;
    }

}








}
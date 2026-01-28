

import 'dart:developer';

import 'package:bookia_store_app/core/services/api/api_endpoints.dart';
import 'package:bookia_store_app/core/services/api/dio_provider.dart';
import 'package:bookia_store_app/features/home/data/models/response/best_seller_response/BestSellerResponse.dart';

class SearchRepo {

 static Future<BestSellerResponse ?> search({required String searchText})async{

   try {
     var res = await DioProvider.get(endPoint: EndPoints.search , queryParameters: {
       'name': searchText,
     }) ;

     if(res.statusCode == 200) {
       return BestSellerResponse.fromJson(res.data) ;
     }else{
       return null ;
     }
   } on Exception catch (e) {
    log(e.toString()) ;
    return null ;
   }


 }


 // static searchFilter() async {
 //   var res = await DioProvider.get(endPoint: EndPoints.filterSearch , queryParameters: {
 //     'max': 300,
 //     'min': 100,
 //     'search': 'v',
 //     'is_bestseller': 1,
 //     'category_id': 10,
 //     'limit': 2,
 //   }) ;
 // }
}
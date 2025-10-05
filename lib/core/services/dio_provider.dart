import 'package:bookia_store_app/core/services/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl ,

    ));
  }

  static Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Object? data,
      Map<String, dynamic>? headers})  async {
    return await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers));
  }


  static Future<Response> post({
    required String endPoint ,
    Map<String , dynamic> ?  queryParameters ,
    Object? data,
    Map<String, dynamic>? headers
}) async {

    return await dio.post(endPoint ,
      queryParameters: queryParameters ,
        data: data,
        options: Options(headers: headers)
    ) ;
}


  static Future<Response> put({
    required String endPoint ,
    Map<String , dynamic> ?  queryParameters ,
    Object? data,
    Map<String, dynamic>? headers
  }) async {

    return await dio.put(endPoint ,
        queryParameters: queryParameters ,
        data: data,
        options: Options(headers: headers)
    ) ;
  }


  static Future<Response> delete({
    required String endPoint ,
    Map<String , dynamic> ?  queryParameters ,
    Object? data,
    Map<String, dynamic>? headers
  }) async{

    return await dio.delete(endPoint ,
        queryParameters: queryParameters ,
        data: data,
        options: Options(headers: headers)
    ) ;
  }








}


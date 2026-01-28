import 'dart:developer';

import 'package:bookia_store_app/core/services/api/api_endpoints.dart';
import 'package:bookia_store_app/core/services/api/dio_provider.dart';
import 'package:bookia_store_app/features/orders/data/models/response/order_response.dart';

import '../../../../core/services/local/shared_pref.dart';

class OrdersRepo {
  static Future<List<OrderResponse>?> ordersHistory() async {
    try {
      var res = await DioProvider.get(
        endPoint: EndPoints.orderHistory,
        headers: {
          'Authorization': "Bearer ${SharedPref.getToken()}",
        },
      );

      if (res.statusCode == 200) {
        final List ordersJson = res.data['data']['orders'];

        return ordersJson
            .map((e) => OrderResponse.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }


}
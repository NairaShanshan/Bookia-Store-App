import 'dart:developer';

import 'package:bookia_store_app/core/services/api/api_endpoints.dart';
import 'package:bookia_store_app/core/services/api/dio_provider.dart';
import 'package:bookia_store_app/features/profile/data/models/response/profile_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/services/local/shared_pref.dart';
import '../models/requests/reset_password_params.dart';
import '../models/requests/update_params.dart';

class ProfileRepo {
  static Future<ProfileResponse?> getProfile() async {
    try {
      var res = await DioProvider.get(endPoint: EndPoints.profile, headers: {
        'Authorization': "Bearer ${SharedPref.getToken()}",
      });
      if (res.statusCode == 200) {
        return ProfileResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> updateProfile(UpdateProfileParams params) async {
    try {
      var res = await DioProvider.post(
          endPoint: EndPoints.updateProfile,
          data: params.toFormData(),
          headers: {
            'Authorization': "Bearer ${SharedPref.getToken()}",
          });
      if (res.statusCode == 200) {
        var data = ProfileResponse.fromJson(res.data);
        SharedPref.setUserData(data.data);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }



  static Future<void> resetPassword(ChangePasswordParams params) async {
    try {
      final res = await DioProvider.post(
        endPoint: EndPoints.updatePassword,
        headers: {
          'Authorization': "Bearer ${SharedPref.getToken()}",
        },
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        final data = ProfileResponse.fromJson(res.data);
        SharedPref.setUserData(data.data);
        return; // success
      }

      // لو الـ API رجع 422 بدون Exception من Dio
      if (res.statusCode == 422) {
        final errors = res.data['errors'];
        final message =
            errors?['current_password']?.first ??
                errors?['new_password']?.first ??
                'Validation error';
        throw Exception(message);
      }
    } on DioException catch (e) {
      // لو Dio Exception (زي 422 أو network)
      if (e.response?.statusCode == 422) {
        final errors = e.response?.data['errors'];
        final message =
            errors?['current_password']?.first ??
                errors?['new_password']?.first ??
                'Validation error';
        throw Exception(message);
      }

      throw Exception('Something went wrong');
    }
  }


}


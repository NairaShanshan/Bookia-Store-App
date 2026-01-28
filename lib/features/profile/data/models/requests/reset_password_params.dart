import 'package:dio/dio.dart';

class ChangePasswordParams {
  String? currentPassword;
  String? newPassword;
  String? newPasswordConfirmation;

  ChangePasswordParams({
    this.currentPassword,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  factory ChangePasswordParams.fromJson(Map<String, dynamic> json) {
    return ChangePasswordParams(
      currentPassword: json['current_password'] as String?,
      newPassword: json['new_password'] as String?,
      newPasswordConfirmation:
      json['new_password_confirmation'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'current_password': currentPassword,
    'new_password': newPassword,
    'new_password_confirmation': newPasswordConfirmation,
  };


  FormData toFormData() {
    return FormData.fromMap(toJson());
  }
}

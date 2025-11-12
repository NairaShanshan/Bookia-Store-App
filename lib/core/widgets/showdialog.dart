import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum DialogType { error, success, info }

showMyDialog(BuildContext context, String message,
    [DialogType type = DialogType.error]) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: type == DialogType.error
          ? Colors.red
          : type == DialogType.success
              ? AppColors.primaryColor
              : AppColors.cardColor));
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Center(child: Lottie.asset('assets/images/loading.json')),
  );
}

import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';


import '../utils/app_colors.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  final Color backGroundColor;

  final String text;

  final Color textColor;

  final Color sideColor;

  final bool isSide;

  final double width ;
  final double height ;

  const MyElevatedButton(
      {super.key,
      required this.onPressed,
        required this.text,
      this.width = double.infinity ,
      this.height = 56 ,
      this.backGroundColor =  AppColors.primaryColor,
      this.textColor = AppColors.backgroundColor,
      this.sideColor = AppColors.darkColor,
      this.isSide = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backGroundColor,
              side: isSide ? BorderSide(color: sideColor) : BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text(
            text,
            style: TextStyles.textStyle15.copyWith(color: textColor),
          )),
    );
  }
}

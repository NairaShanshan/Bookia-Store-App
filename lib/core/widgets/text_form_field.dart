
import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyTextFormField extends StatelessWidget {
  const  MyTextFormField(
      {super.key,
      required this.hintText,
      required this.validateMessage,
      required this.controller,
      required this.keyboardType,
      this.suffixPressed,  this.suffixIcon, this.readOnly=false, this.onTap
       });

  final String hintText;

  final String validateMessage;

  final TextEditingController controller;

  final TextInputType keyboardType;

  final bool isPassword = false;
  final bool readOnly ;

  final Function()? suffixPressed;
  final Function()? onTap ;
  final Widget? suffixIcon ;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly ,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.accentColor,
        hintText: hintText,
        suffix: ( suffixPressed != null)
            ? IconButton(
                onPressed: suffixPressed,
                icon: SvgPicture.asset(AppImages.eyeSvg),
              )
            : null,
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.textStyle15.copyWith(
          color: AppColors.greyColor,
        ) ,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.borderColor,

          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const  BorderSide(color: AppColors.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const  BorderSide(color: AppColors.errorColor),
        ),

      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validateMessage;
        }
        return null;
      },
    );
  }
}

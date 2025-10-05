import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  final Color buttonColor;

  final String text;

  final Color textColor;

  final Color sideColor;

  final bool isSide;

  const MyElevatedButton(
      {super.key,
      required this.onPressed,
      this.buttonColor = const Color(0xFFBFA054),
      required this.text,
      this.textColor = Colors.white,
      this.sideColor = const Color(0xFF2F2F2F),
      this.isSide = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              side: isSide ? BorderSide(color: sideColor) : BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.sp),
          )),
    );
  }
}

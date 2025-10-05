import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.hintText,
      required this.validateMessage,
      required this.controller,
      required this.keyboardType,
       this.suffixPressed ,
       this.suffixIcon });

  final String hintText;

  final String validateMessage;

  final TextEditingController controller;

  final TextInputType keyboardType;

  final bool isPassword = false;

  final Function() ? suffixPressed;

  final   IconData  ? suffixIcon ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
          filled: true,
          fillColor:const Color.fromARGB(255, 247, 248, 249),
          hintText: hintText,
          suffix: (suffixIcon != null && suffixPressed != null)
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffixIcon),
          )
              : null,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xFF8391A1),
          ),
         enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFE8ECF4), // لون البوردر لما يكون مش فوكس
            width: 2,                 // سمك البوردر
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFE8ECF4), // نفس لون البوردر العادي
            width: 2,
          ),
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

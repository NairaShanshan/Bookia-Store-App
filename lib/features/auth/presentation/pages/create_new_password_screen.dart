import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/password_changed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/images/back.svg',
                width: 41,
                height: 41,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create new password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2F2F2F),
                    letterSpacing: -1,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Your new password must be unique from those previously used.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8391A1),
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextFormField(
                    hintText: 'New Password ',
                    validateMessage: 'Please Enter your Password',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                MyTextFormField(
                    hintText: 'Confirm password',
                    validateMessage: 'Please Confirm password ',
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 30,
                ),
                MyElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswordChanged()));
                    },
                    text: 'Reset Password'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

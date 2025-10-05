import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/forget_password.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
       title:Row(children: [GestureDetector(
         onTap: (){
           pop(context) ;
         },
         child: SvgPicture.asset(
           'assets/images/back.svg',
           width: 41,
           height: 41,
         ),
       ),],) ,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Welcome back! Glad to see you, Again!',
                  style:TextStyles.textStyle30.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkColor ,
                    letterSpacing: -1,
                    height: 1.5,
                  )   ,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextFormField(
                    hintText: 'Enter your email',
                    validateMessage: 'Please Enter your email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                MyTextFormField(
                    hintText: 'Enter Your Password ',
                    validateMessage: 'Please Enter Your Password ',
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        pushTo(context, ForgetPasswordScreen()) ;

                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: AppColors.greyColor),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyElevatedButton(onPressed: () {}, text: 'Login'),
                const SizedBox(
                  height: 30,
                ),
                 Row(
                  children: [
                    const Expanded(child: Divider()),
                    Expanded(
                      child: Text(
                        'Or Login with',
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/google_ic.svg',
                        width: 26,
                        height: 26,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                       Text(
                        'Sign in with Google',
                        style: TextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFE8ECF4),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/cib_apple.svg',
                        width: 26,
                        height: 26,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                       Text(
                        'Sign in with Apple',
                        style:TextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'Don’t have an account?',
              style:TextStyles.textStyle15.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.darkColor ,
              ) ,
            ),
            TextButton(
              onPressed: () {
                pushTo(context, RegisterScreen()) ;

              },
              child:  Text(
                'Register Now',
                style:TextStyles.textStyle15.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkColor ,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

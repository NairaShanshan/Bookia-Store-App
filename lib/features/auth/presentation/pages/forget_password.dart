import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/login_screen.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController()  ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Row(children: [GestureDetector(
          onTap: (){
            Navigator.pop(context) ;
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

                const Text(
                  'Forgot Password?',
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
                  'Don \t worry! It occurs. Please enter the email address linked with your account.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8391A1),
                    letterSpacing: -1,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                MyTextFormField(hintText: 'Enter Your Email',
                    validateMessage: 'Please Enter your email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 30,
                ),
                MyElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => OTPVerificationScreen()) ) ;

                }, text: 'Send Code'),
                const SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Remember Password?' , style: TextStyle(
                      fontSize: 15 ,
                      color: Color(0xFF24282C) ,
                      fontWeight: FontWeight.w500,
                    ),) ,
                    TextButton(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => LoginScreen()) ) ;

                    }, child:const  Text(' Login', style: TextStyle(
                        fontSize: 15 ,
                        color: Color(0xFFBFA054) ,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1
                    ),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



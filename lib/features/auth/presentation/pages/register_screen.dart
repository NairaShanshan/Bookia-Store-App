import 'dart:developer';

import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/showdialog.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthErrorState) {
          pop(context);
          showErrorDialog(context, 'Auth Failed');
        } else if (state is AuthSuccessState) {
          // push To Home
          pop(context);
          log('Auth Success');
        }
      },

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:Row(children: [GestureDetector(
            onTap: (){
              pop(context);
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
                    'Hello! Register to get started',
                    style: TextStyles.textStyle30.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkColor ,
                      letterSpacing: -1,
                      height: 1.5,
                    )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextFormField(hintText: 'Username ',
                      validateMessage: 'Please Enter your name',
                      controller: cubit.nameController,
                      keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(hintText: 'Email',
                      validateMessage: 'Please Enter your email',
                      controller: cubit.emailController,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(hintText: 'Password ',
                      validateMessage: 'Please Enter Your Password ',
                      controller: cubit.passwordController,
                      keyboardType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(hintText: 'Confirm password',
                      validateMessage: 'Please Confirm password ',
                      controller: cubit.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 30,
                  ),
                  MyElevatedButton(onPressed: () {}, text: 'Register'),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?' , style: TextStyles.textStyle15 ) ,
                      TextButton(onPressed: (){
                        pushTo(context, LoginScreen()) ;

                      }, child:  Text(' Login Now', style: TextStyles.textStyle15.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1
                      ) ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/showdialog.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_states.dart';

class RegisterScreen extends StatelessWidget {
 const  RegisterScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit,AuthStates>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, 'Auth Failed');
        } else if (state is AuthSuccessState) {
          pushToBase(context, Routes.main);
        }
      },

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:Row(children: [GestureDetector(
            onTap: (){
              pop(context) ;
            },
            child: SvgPicture.asset(
             AppImages.backSvg,

            ),
          ),],) ,
        ),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello! Register to get started',
                    style: TextStyles.textStyle30
                  ),
                  const  Gap(32),
                  MyTextFormField(hintText: 'Username ',
                      validateMessage: 'Please Enter your name',
                      controller: cubit.nameController,
                      keyboardType: TextInputType.name),
                  const  Gap(15),
                  MyTextFormField(hintText: 'Email',
                      validateMessage: 'Please Enter your email',
                      controller: cubit.emailController,
                      keyboardType: TextInputType.emailAddress),
                  const  Gap(15),
                  MyTextFormField(hintText: 'Password ',
                      validateMessage: 'Please Enter Your Password ',
                      controller: cubit.passwordController,
                      keyboardType: TextInputType.visiblePassword),
                  const  Gap(15),
                  MyTextFormField(hintText: 'Confirm password',
                      validateMessage: 'Please Confirm password ',
                      controller: cubit.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword),
                  const  Gap(34),
                  MyElevatedButton(onPressed: () {
                    if(cubit.formKey.currentState!.validate()) {
                      context.read<AuthCubit>().register() ;
                    }
                  }, text: 'Register'),

                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style:TextStyles.textStyle15 ,
              ),
              TextButton(
                onPressed: () {
                  pushTo(context, Routes.login) ;

                },
                child:  Text(
                    'Sign in',
                    style:TextStyles.textStyle15.copyWith(
                      color: AppColors.primaryColor ,
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




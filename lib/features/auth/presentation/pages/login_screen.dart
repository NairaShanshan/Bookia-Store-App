import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/showdialog.dart';
import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:bookia_store_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_store_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>() ;
    return BlocListener<AuthCubit , AuthStates>(
      listener: (context , state) {
        if(state is AuthLoadingState){
          showLoadingDialog(context) ;
        }else if(state is AuthErrorState){
          pop(context);
          showMyDialog(context , 'Something went wrong' ) ;

        }else if(state is AuthSuccessState) {
          pushToBase(context, Routes.main) ;
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
                    'Welcome back! Glad to see you, Again!',
                    style:TextStyles.textStyle30
                       ,
                  ),
                  const Gap(30),
                  MyTextFormField(
                      hintText: 'Enter your email',
                      validateMessage: 'Please Enter your email',
                      controller: cubit.emailController,
                      keyboardType: TextInputType.emailAddress),
                  const Gap(15),
                  MyTextFormField(
                      hintText: 'Enter Your Password ',
                      validateMessage: 'Please Enter Your Password ',
                      controller: cubit.passwordController,
                      keyboardType: TextInputType.visiblePassword),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          //pushTo(context, ForgetPasswordScreen()) ;

                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: AppColors.greyColor),
                        )),
                  ),
                  const Gap(20),
                  MyElevatedButton(onPressed: () {
                    if(cubit.formKey.currentState!.validate()) {
                      context.read<AuthCubit>().login() ;
                    }
                  }, text: 'Login'),
                  const Gap(34),
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
                  const Gap(20),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.borderColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.googleSvG,
                          ),
                          const Gap(10),
                           const Text(
                            'Sign in with Google',
                            style: TextStyles.textStyle15 ,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.borderColor,

                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.appleSvG,
                          ),
                          const Gap(10),
                          const  Text(
                            'Sign in with Apple',
                            style:TextStyles.textStyle15
                          )
                        ],
                      ),
                    ),
                  ),


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
                'Don’t have an account?',
                style:TextStyles.textStyle15 ,
              ),
              TextButton(
                onPressed: () {
                  pushReplacementTo(context, Routes.register) ;

                },
                child:  Text(
                  'Register Now',
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

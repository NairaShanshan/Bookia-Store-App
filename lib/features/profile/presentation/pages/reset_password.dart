import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/showdialog.dart';
import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:bookia_store_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia_store_app/features/profile/presentation/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routes/navigations.dart';

class ResetPasswordScreen extends StatelessWidget {
  const  ResetPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>() ;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  pop(context);
                },
                child: SvgPicture.asset(AppImages.backSvg)),
            const Gap(70),
            const Text('Reset Password'),
          ],
        ),
      ),
      body: BlocListener<ProfileCubit , ProfileStates>(
        listener: (context , state) {
          if(state is LoadingProfileState){
            showLoadingDialog(context) ;
          }else if(state is ErrorProfileState){
            pop(context);
            showMyDialog(context, state.message ?? 'Validation Error') ;
          }else if(state is SuccessProfileState){
            pop(context);
            pop(context) ;
            showMyDialog(context, 'Password Updated Successfully' , DialogType.success) ;
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cubit.formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current Password',
                    style: TextStyles.textStyle18,
                  ),
                  const Gap(10),
                  MyTextFormField(
                      hintText: '******',
                      validateMessage: 'Please enter your current password',
                      controller: cubit.currentPassword,
                      keyboardType: TextInputType.visiblePassword),
                  const Gap(20),
                  const Text(
                    'New Password',
                    style: TextStyles.textStyle18,
                  ),
                  const Gap(10),
                  MyTextFormField(
                      hintText: '******',
                      validateMessage: 'Please enter your new password',
                      controller: cubit.newPassword,
                      keyboardType: TextInputType.visiblePassword),
                  const Gap(20),
                  const Text(
                    'Confirm Password',
                    style: TextStyles.textStyle18,
                  ),
                  const Gap(10),
                  MyTextFormField(
                      hintText: '******',
                      validateMessage: 'Please confirm your new password',
                      controller: cubit.newPasswordConfirmation,
                      keyboardType: TextInputType.visiblePassword),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: MyElevatedButton(onPressed: (){
          cubit.resetPassword() ;
        }, text: 'Reset Password '),
      )),
    );
  }
}

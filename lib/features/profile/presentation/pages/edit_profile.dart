import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/showdialog.dart';
import 'package:bookia_store_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia_store_app/features/profile/presentation/cubit/profile_states.dart';
import 'package:bookia_store_app/features/profile/presentation/widgets/profile_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/text_form_field.dart';


class EditProfileScreen extends StatelessWidget {
   const EditProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: (){
                  pop(context);
                },
                child: SvgPicture.asset(AppImages.backSvg)),
            const Gap(70) ,
            const Text('Edit Profile'),
          ],
        ),

      ),
      body: BlocListener<ProfileCubit , ProfileStates>(
        listener: (context , state) {
          if(state is LoadingProfileState){
            showLoadingDialog(context);
          }else if(state is ErrorProfileState){
            pop(context);
            showMyDialog(context, 'Can\'t Edit Profile ') ;
          }else if(state is SuccessProfileState){
            pop(context) ;
            showMyDialog(context, 'Profile Updated Successfully', DialogType.success);
            pushToBase(context, Routes.main , extra: 1) ;
          }


        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileImage() ,
                  const Gap(20),
                  const Text(
                    'Full Name',
                    style: TextStyles.textStyle18,
                  ),
                  const Gap(10),
                  MyTextFormField(
                    validateMessage:'Please Enter Your Name' ,
                    controller:cubit.nameController ,
                    hintText: 'Full Name',
                    keyboardType: TextInputType.name,

                  ),
                  const Gap(20),
                  const Text(
                    'Phone',
                    style: TextStyles.textStyle18,
                  ),
                  const Gap(10),
                  MyTextFormField(
                    validateMessage:'Please Enter Your Phone' ,
                    controller:cubit.phoneController ,
                    hintText: 'Phone',
                    keyboardType: TextInputType.phone,

                  ),
                  const Gap(20),
                  const Text(
                    'Address',
                    style: TextStyles.textStyle18,
                  ),
                  const Gap(10),
                  MyTextFormField(
                    validateMessage:'Please Enter Your Address' ,
                    controller:cubit.addressController ,
                    hintText: 'Address',
                    keyboardType: TextInputType.streetAddress,

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: MyElevatedButton(
            text: 'Update Profile',
            width: double.infinity,
            onPressed: () {
              cubit.updateProfile() ;
            },
          ),
        ),
      ),
    );
  }
}

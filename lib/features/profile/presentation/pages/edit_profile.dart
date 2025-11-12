import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 250,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
        title: Stack(
          children:[
            PositionedDirectional(
              start: -5,
                top: -6,
                child: IconButton(onPressed: (){
                  pop(context) ;
                }, icon:const  Icon(Icons.arrow_back_ios_new , color: AppColors.backgroundColor,))) ,

            Column(
            children: [
              Text(
                'Set up your profile',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyles.textStyle20.copyWith(
                  color: AppColors.accentColor,
                ),
              ),
              const Gap(20),
              Text(
                'Update your profile to connect your doctor with better impression ',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyles.textStyle16
                    .copyWith(color: AppColors.accentColor),
              ),
              const Gap(20),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      AppImages.book,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: -8,
                      right: -8,
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.cameraSvg)))
                ],
              )
            ],
          ),
          ]
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personal Information',
                style: TextStyles.textStyle20,
              ),
              const Gap(15),
              // MyTextFormField(
              //   validateMessage: ,
              //   controller: ,
              //   hintText: 'Name',
              //   keyboardType: TextInputType.name,
              //   suffixIcon:
              //   IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              //
              // ),
              const Gap(15),
              // MainTextFormField(
              //   hintText: 'Phone',
              //   textInputType: TextInputType.phone,
              //   borderColor: Colors.transparent,
              //   suffixIcon:
              //   IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              //   suffixIconColor: AppColors.greyColor,
              // ),
              const Gap(15),
              // MainTextFormField(
              //   hintText: 'Date of birth',
              //   textInputType: TextInputType.datetime,
              //   borderColor: Colors.transparent,
              //   suffixIcon:
              //   IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              //   suffixIconColor: AppColors.greyColor,
              // ),
              const Gap(15),
              // MainTextFormField(
              //   hintText: 'Address',
              //   textInputType: TextInputType.streetAddress,
              //   borderColor: Colors.transparent,
              //   suffixIcon:
              //   IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              //   suffixIconColor: AppColors.greyColor,
              // ),
              const Gap(40),
              MyElevatedButton(
                text: 'Update Profile',
                width: double.infinity,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

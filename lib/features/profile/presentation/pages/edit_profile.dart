import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';

import '../../../../core/widgets/text_form_field.dart';


class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({super.key});

  final nameController = TextEditingController() ;
  final phoneController = TextEditingController() ;
  final addressController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                ],
              ),
              const Gap(15),
              MyTextFormField(
                validateMessage:'Please Enter Your Name' ,
                controller:nameController ,
                hintText: 'Full Name',
                keyboardType: TextInputType.name,

              ),
              const Gap(15),
              MyTextFormField(
                validateMessage:'Please Enter Your Phone' ,
                controller:phoneController ,
                hintText: 'Phone',
                keyboardType: TextInputType.phone,

              ),
              const Gap(15),
              MyTextFormField(
                validateMessage:'Please Enter Your Address' ,
                controller:addressController ,
                hintText: 'Address',
                keyboardType: TextInputType.streetAddress,

              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: MyElevatedButton(
            text: 'Update Profile',
            width: double.infinity,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

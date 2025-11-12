import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../widgets/container_widget.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      AppImages.book,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(20),
                   const Text(
                    'UserName',
                    style: TextStyles.textStyle20,
                  )
                ],
              ),
              const Gap(20),
              ContainerWidget(name: 'My Doctors' , onTap: (){
                // push Replacement to favourite screen
              },) ,
              const Gap(20),
              ContainerWidget(name: 'My Appointment' , onTap: (){
                //push Replacement to  Appointment screen
              }) ,
              const Gap(20),
              ContainerWidget(name: 'Edit Profile' , onTap: ()
              {
                // pushTo(context:  context,path:  Routes.editProfile) ;
              },) ,
              const Gap(20),
              ContainerWidget(name: 'Logout' , onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: AppColors.backgroundColor,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Logout',
                                style: TextStyles.textStyle20,
                              ),
                              const Gap(10),
                              Text(
                                'Are you sure you want to logout ?',
                                style: TextStyles.textStyle20
                                    .copyWith(color: AppColors.greyColor),
                              ),
                              const Gap(30),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                       pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style:
                                        TextStyles.textStyle16.copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                      )),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Yes',
                                        style:
                                        TextStyles.textStyle16.copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }) ,


            ],
          ),
        ),
      ),
    );
  }
}

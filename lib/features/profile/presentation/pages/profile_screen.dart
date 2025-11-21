import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.logoutSvg)) ,
        ],
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
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text(
                        'UserName',
                        style: TextStyles.textStyle20,
                                         ),
                        Text(
                         'email@gmail.com',
                         style: TextStyles.textStyle15.copyWith(
                           color: AppColors.greyColor
                         ),
                       ),
                     ],
                   )
                ],
              ),
              const Gap(20),
              ContainerWidget(name: 'My Orders' , onTap: (){
                // push Replacement to favourite screen
              },) ,
              const Gap(20),
              ContainerWidget(name: 'Edit Profile' , onTap: (){
                pushTo(context, Routes.editProfile) ;
              }) ,
              const Gap(20),
              ContainerWidget(name: 'Reset Password' , onTap: ()
              {
                // pushTo(context:  context,path:  Routes.editProfile) ;
              },) ,
              const Gap(20),
              ContainerWidget(name: 'FAQ' , onTap: ()
              {
                // pushTo(context:  context,path:  Routes.editProfile) ;
              },) ,
              const Gap(20),
              ContainerWidget(name: 'Contact Us' , onTap: ()
              {
                // pushTo(context:  context,path:  Routes.editProfile) ;
              },) ,
              const Gap(20),

              ContainerWidget(name: 'Privacy & Terms' , onTap: () {
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

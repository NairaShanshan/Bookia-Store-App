import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.splash,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                const Spacer(flex: 2,) ,
                SvgPicture.asset(
                  AppImages.logoSvg,
                ),
                const Gap(25) ,
                const  Text(
                  'Order Your Book Now!',
                  style: TextStyles.textStyle18
                ),
                const Spacer(flex: 5,),
                MyElevatedButton(onPressed: (){
                 pushTo(context, Routes.login) ;
                }, text: 'Login' , isSide: false,) ,
                const Gap(15) ,
                MyElevatedButton(onPressed: (){
                  pushTo(context, Routes.register) ;
                }, text: 'Register' , backGroundColor:AppColors.backgroundColor ,  textColor:AppColors.darkColor,isSide: true,) ,
                const Spacer() ,
              ],
            ),
          )
        ],
      ),
    );
  }
}

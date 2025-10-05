import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/login_screen.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_image.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 65 ,
              horizontal: 12
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/logo2.svg',
                  width: 219.w,
                  height: 66.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Order Your Book Now!',
                    textAlign: TextAlign.center,
                  style: TextStyles.textStyle20.copyWith(
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w500,


                  )
                ),
                const Spacer(),
                MyElevatedButton(onPressed: (){
                  pushTo(context, LoginScreen()) ;
                }, text: 'Login' , isSide: false,) ,
                SizedBox(height: 12.h,),
                MyElevatedButton(onPressed: (){
                  pushTo(context, RegisterScreen()) ;
                }, text: 'Register' , buttonColor:AppColors.backgroundColor ,  textColor:AppColors.darkColor,isSide: true,) ,
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

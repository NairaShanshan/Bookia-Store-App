
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordChanged extends StatefulWidget {
  const PasswordChanged({super.key});

  @override
  State<PasswordChanged> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<PasswordChanged> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3) , (){
      //pushReplacementTo(context,  HomeScreen()) ;
    } ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/Successmark.svg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 30,),
            const Text('Password Changed!' , style:TextStyles.textStyle30 ),
            const SizedBox(height: 20,),
            Text('Your password has been changed successfully.' ,
              textAlign: TextAlign.center,
              style: TextStyles.textStyle18.copyWith(
                color: AppColors.greyColor ,
                fontWeight: FontWeight.w500,
              )  ),
            const SizedBox(height: 50,),
            MyElevatedButton(onPressed: (){
             // pushTo(context, LoginScreen()) ;

            },
                text: 'Back to Login')
          ],
        ),
      ),
    );
  }
}

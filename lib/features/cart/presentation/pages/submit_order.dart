
import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubmitOrder extends StatefulWidget {
  const SubmitOrder({super.key});

  @override
  State<SubmitOrder> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<SubmitOrder> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3) , (){
     pushToBase(context, Routes.main , extra:  0) ;
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
              AppImages.successMarkSvG,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 30,),
            const Text('SUCCESS!' , style:TextStyles.textStyle30 ),
            const SizedBox(height: 20,),
            Text('Your order will be delivered soon. Thank you for choosing our app!' ,
                textAlign: TextAlign.center,
                style: TextStyles.textStyle18.copyWith(
                  color: AppColors.greyColor ,
                  fontWeight: FontWeight.w500,
                )  ),
            const SizedBox(height: 50,),
            MyElevatedButton(onPressed: (){
              pushToBase(context, Routes.main, extra: 0) ;

            },
                text: 'Back To Home')
          ],
        ),
      ),
    );
  }
}

import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:bookia_store_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_store_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routes/navigations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit , AuthStates>(
      listener: (context , state) {
        if(state is LogoutSuccessState){
          pop(context);
          pushToBase(context, Routes.welcome) ;
        }
      },
      child: IconButton(
          onPressed: () {
            var cubit = context.read<AuthCubit>() ;
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyles.textStyle16.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    cubit.logout() ;
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyles.textStyle16.copyWith(
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
          },
          icon: SvgPicture.asset(AppImages.logoutSvg)),
    );
  }
}

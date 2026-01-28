import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  AppImages.noProfilePicture,
                  width: 120,
                  height: 120,

                )),
            Positioned(
              bottom: -5,
              right: -5,
              child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    padding:const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.backgroundColor),
                      child: SvgPicture.asset(AppImages.cameraSvg))),
            )
          ],
        )
      ],
    );
  }
}

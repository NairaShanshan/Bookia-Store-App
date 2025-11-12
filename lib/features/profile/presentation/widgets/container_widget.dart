import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.name, required this.onTap});

  final String name;
  final Function() onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:onTap ,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.accentColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyles.textStyle18,
              ),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ));
  }
}

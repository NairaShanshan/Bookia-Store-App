import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/elevated_button.dart';
import '../../data/models/response/best_seller_response/BestSellerResponse.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});

  final Product product ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        pushTo(context, Routes.detailsScreen , extra: product) ;
      },
      child: Container(
        padding:const  EdgeInsets.all(10),
        height: 163,
        width: 281,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12) ,
          color: AppColors.cardColor ,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.id ?? '',
              child: ClipRRect(
                borderRadius : BorderRadius.circular(5)   ,
                child: Image.network(
                  product.image ?? '' ,
                  width: 175,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ) ,
            const Gap(10) ,
            Expanded(
              child: Text(product.name ?? '' , style: TextStyles.textStyle18,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),
            ) ,
            const Gap(10) ,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${double.parse(product.price ?? '').toStringAsFixed(0)}', style: TextStyles.textStyle18, ) ,

                  MyElevatedButton(onPressed: (){},
                    text: 'Buy' ,
                    backGroundColor: AppColors.darkColor,
                    width: 75,
                    height: 28,
              
                  )
                ],
              ),
            )

          ],
        ),
      ),
    ) ;
  }
}

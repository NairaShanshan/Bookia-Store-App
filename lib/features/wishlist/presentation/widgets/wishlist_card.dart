import 'package:bookia_store_app/features/home/data/models/response/best_seller_response/BestSellerResponse.dart';
import 'package:flutter/material.dart';


import '../../../../core/utils/app_colors.dart';
import 'package:gap/gap.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({super.key, required this.onDelete, required this.product});

  final Function() onDelete ;
  final Product product ;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.all(20), 
        decoration: BoxDecoration(
          color: AppColors.errorColor ,
          borderRadius: BorderRadius.circular(10) 
        ),
        child:const  Center(
          child: Icon(Icons.delete , color: Colors.white,),
        ),
      ),
      onDismissed: (direction){

        onDelete() ;

      },
      child: Container(
          padding: const EdgeInsets.all(10),
          height: 138,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.cardColor,
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.image ?? '',
                width: 115,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(15) ,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  product.name ?? '',
                  style: TextStyles.textStyle18,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(10),
                Text(
                  '\$${double.parse(product.price ?? '').toStringAsFixed(0)}',
                  style: TextStyles.textStyle16,
                ),
                const Gap(10),
                Text(
                  product.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.textStyle14.copyWith(
                    color: AppColors.greyColor ,
                  ),
                ),
              ]),
            )
          ])),
    );

  }
}

import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../home/data/models/response/best_seller_response/BestSellerResponse.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.product, required this.heroTag});

  final Product product ;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        pushTo(context, Routes.detailsScreen , extra: {
          'product': product,
          'heroTag': heroTag,

        }) ;
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          height: 138,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.cardColor,
          ),
          child: Row(children: [
            Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? '',
                  width: 115,
                  fit: BoxFit.cover,
                ),
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

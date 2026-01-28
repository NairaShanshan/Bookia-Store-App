
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/text_styles.dart';
import '../../data/models/response/best_seller_response/BestSellerResponse.dart';

class BestsellerProducts extends StatelessWidget {
  const BestsellerProducts({super.key,required this.products});

  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Best Seller',
              style: TextStyles.textStyle24,

            ),
           const  Spacer(),
            Text('See All >', style: TextStyles.textStyle16.copyWith(
              color: AppColors.primaryColor , ) )
          ],
        ),
        const Gap(20),
        SizedBox(
          height: 300,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context , index) =>const  Gap(10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return BookCard(product: products[index] , height: 150, width: 180, heroTag: 'best_${products[index].id}_$index',) ;
              }),
        ),

      ],
    );
  }
}

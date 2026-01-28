import 'package:bookia_store_app/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/text_styles.dart';
import '../../data/models/response/best_seller_response/BestSellerResponse.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All Products',
          style: TextStyles.textStyle24,
        ),
        const Gap(20),
        GridView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 15,
                mainAxisExtent: 300),
            itemBuilder: (context, index) {
              return BookCard(
                product: products[index],
                height: 163,
                width: 281,
                heroTag: 'all_${products[index].id}_$index',
              );
            }),
      ],
    );
  }
}

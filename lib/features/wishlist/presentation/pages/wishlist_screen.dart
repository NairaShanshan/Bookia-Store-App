import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';

import 'package:bookia_store_app/features/wishlist/presentation/cubit/cubit.dart';
import 'package:bookia_store_app/features/wishlist/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../widgets/wishlist_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishList(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Wishlist',
            style: TextStyles.textStyle24
                .copyWith(letterSpacing: -1, color: AppColors.darkColor),
          ),
        ),
        body: BlocBuilder<WishListCubit, WishListStates>(
            builder: (context, state) {
          var cubit = context.read<WishListCubit>();
          if (state is! WishListSuccessState) {
            return const Center(child: CircularProgressIndicator());
          } else if (cubit.products.isEmpty ) {
            return _emptyWishlist();
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: cubit.products.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) =>  WishListCard(
                product: cubit.products[index],
                onDelete: () {
                  cubit.removeFromWishList(id: cubit.products[index].id ?? 0) ;
                },
              ),
            );
          }
        }),
      ),
    );
  }

  Center _emptyWishlist() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.bookMarkSvg,
            height: 100,
            colorFilter:const  ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const Gap(20),
         const  Text('Your wishlist is empty'),
        ],
      ),
    );
  }
}

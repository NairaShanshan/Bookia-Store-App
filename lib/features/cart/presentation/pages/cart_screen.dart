import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/showdialog.dart';
import 'package:bookia_store_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_store_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Cart',
            style: TextStyles.textStyle24
                .copyWith(letterSpacing: -1, color: AppColors.darkColor),
          ),
        ),
        body: BlocConsumer<CartCubit, CartStates>(
          listener: (context, state) {
            if(state is CheckoutLoadingState) {
              showLoadingDialog(context);
            }else
            if(state is CheckoutSuccessState) {
              var total = context.read<CartCubit>().cartResponse?.data?.total ?? '0' ;
              pop(context);
              pushTo(context, Routes.placeOrder , extra:total ) ;
            }else if(state is CheckoutErrorState){
              pop(context);
              showMyDialog(context, 'Something went wrong', DialogType.error) ;

            }
          },
          builder: (context, state) {
            var cubit = context.read<CartCubit>();
            var books = cubit.cartResponse?.data?.cartItems ?? [];
            if (state is CartLoadingState ||state is CartErrorState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (cubit.cartResponse?.data?.cartItems!.isEmpty == true) {
              return emptyCart();
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartCard(
                                onDelete: () {
                                  cubit.removeFromCart(
                                      id: books[index].itemId ?? 0);
                                },
                                onUpdate: (q ){
                                 cubit.updateCart(cartItemId: books[index].itemId ?? 0 , itemQuantity: q) ;
                                },
                                cartItems: books[index]);
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount:
                              cubit.cartResponse?.data?.cartItems!.length ?? 0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             const Text('Total : ' , style: TextStyles.textStyle18,) ,
                              Text('\$ ${double.tryParse(cubit.cartResponse?.data?.total.toString() ?? "0")?.toStringAsFixed(0)}' , style: TextStyles.textStyle18,) ,
                            ],
                          ) ,
                          const Gap(20),
                          MyElevatedButton(onPressed: () {
                            cubit.checkout();
                          }, text: 'Checkout') ,
                        ],
                      ),
                    )


                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Center emptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppImages.categorySvg,
            height: 100,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const Gap(20),
          const Text(
            'Your cart is empty ',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

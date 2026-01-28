import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/features/orders/presentation/cubit/order_cubit.dart';
import 'package:bookia_store_app/features/orders/presentation/cubit/order_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routes/navigations.dart';
import '../../../../core/utils/text_styles.dart';


class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  pop(context);
                },
                child: SvgPicture.asset(AppImages.backSvg)),
            const Gap(70),
            const Text('My Orders'),
          ],
        ),
      ),
      body: BlocBuilder<OrderCubit, OrderStates>(
        builder: (context , state ) {
          var cubit = context.read<OrderCubit>();
          if(state is! OrderSuccessState) {
            return const  Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
          }
          else if (cubit.orders.isEmpty) {
            return _emptyOrders() ;
          }else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                scrollDirection: Axis.vertical,
                itemCount: cubit.orders.length,
                separatorBuilder: (context, index) =>
                const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    childrenPadding: const EdgeInsets.symmetric(vertical: 10),
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    backgroundColor: AppColors.accentColor,
                    collapsedBackgroundColor: AppColors.accentColor,
                    title: Text(
                      'Order Code :  ${cubit.orders[index].orderCode}',
                      style: TextStyles.textStyle18,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month_rounded,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                               Text(
                                cubit.orders[index].orderDate,
                                style: TextStyles.textStyle16,
                              ),
                              const SizedBox(width: 30),
                            ],
                          ),
                          Row(
                            children: [
                               const Icon(
                                Icons.info_outline,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Status : ${cubit.orders[index].status}',
                                style: TextStyles.textStyle16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5,
                          right: 10,
                          left: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: AppColors.accentColor,
                                  backgroundColor: AppColors.primaryColor,
                                ),
                                onPressed: () {},
                                child:  Text('Total :  ${cubit.orders[index].total}' , style: TextStyles.textStyle16,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ) ;
          }
        },

      ),
    );
  }

  Center _emptyOrders() {
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
          const  Text('No Orders Yet '),
        ],
      ),
    );
  }
}

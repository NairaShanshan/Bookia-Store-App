import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/core/widgets/showdialog.dart';
import 'package:bookia_store_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_store_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../data/models/response/best_seller_response/BestSellerResponse.dart';

class DetailsScreen  extends StatelessWidget {
  const DetailsScreen ({super.key,required this.product});
  final Product product ;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit , HomeStates>(
      listener: (context , state ) {
        if(state is LoadingHomeState) {
          showLoadingDialog(context) ;
        }else if(state is ErrorHomeState) {
          pop(context) ;
          showMyDialog(context, 'SomeThing went wrong ') ;
        }else if(state is SuccessHomeState){
          pop(context) ;
          showMyDialog(context, state.message ?? '' , DialogType.success) ;

        }
      },
      child: Scaffold(
         appBar: AppBar(
           automaticallyImplyLeading: false,
           title: Row(
             children: [
               GestureDetector(
                 onTap: (){
                   pop(context) ;
                 },
                 child: SvgPicture.asset(AppImages.backSvg),
               ),
             ],
           ),
           actions: [
             IconButton(onPressed: (){
               context.read<HomeCubit>().addToWishList(id: product.id ?? 0) ;
             },
                 icon: SvgPicture.asset(AppImages.bookMarkSvg))
           ],
         ),
          body: SingleChildScrollView(
            
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Hero(
                      tag: product.id ?? '',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(product.image ?? '' ,
                          width: 184,
                          height: 271,
                        ),
                      ),
                    ) ,
                    const Gap(10) ,
                    Text(product.name ?? '' , style: TextStyles.textStyle24, maxLines: 1, overflow: TextOverflow.ellipsis,) ,
                    const Gap(10) ,
                    Text(product.category ?? '' , style: TextStyles.textStyle20.copyWith(
                      color: AppColors.primaryColor
                    ), maxLines: 1, overflow: TextOverflow.ellipsis,) ,
                    const Gap(20) ,
                    Text(product.description ?? '' , style: TextStyles.textStyle15 , textAlign: TextAlign.justify,  )

                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( '\$${double.parse(product.price ?? '').toStringAsFixed(0)}', style: TextStyles.textStyle24,) ,
                  MyElevatedButton(onPressed: (){
                    context.read<HomeCubit>().addToCart(id: product.id ?? 0) ;
                  },
                      text: 'Add To Cart' ,
                    backGroundColor: AppColors.darkColor,
                    width: 212,
                    height: 56,
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}

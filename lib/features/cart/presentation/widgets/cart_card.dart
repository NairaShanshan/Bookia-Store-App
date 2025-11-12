
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/showdialog.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data/models/cart_response/cart_response.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.onDelete, required this.cartItems, required this.onUpdate});

  final Function() onDelete ;
  final Function(int) onUpdate ;
  final CartItems cartItems ;


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red ,
          borderRadius: BorderRadius.circular(10) ,
        ),
        child:const  Center(
          child: Icon(Icons.delete , color: Colors.white,),
        ),
      ),
      onDismissed: (direction) {onDelete() ;},
      child: Container(
        padding:const  EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10) ,
          color: AppColors.cardColor
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(cartItems.itemProductImage ?? '' , fit: BoxFit.cover,  width: 118,),

            ) ,
            const Gap(15) ,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItems.itemProductName ?? '',maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyles.textStyle18,) ,
                  const Gap(10) ,
                  Row(
                    children: [
                      Text( '\$ ${(cartItems.itemProductPriceAfterDiscount ?? 0).toStringAsFixed(0) }' , style: TextStyles.textStyle18,),
                      const Gap(10) ,
                      Text( '\$ ${double.tryParse(cartItems.itemProductPrice ?? "0")?.toStringAsFixed(0)}' , style: TextStyles.textStyle18.copyWith(
                        decoration: TextDecoration.lineThrough ,
                        color: AppColors.greyColor
                      ),),
                    ],
                  ) ,
                  const Gap(20) ,
                  Row(
                    children: [
                      GestureDetector(
                        onTap : (){
                          if( (cartItems.itemQuantity ?? 1) > 1 ) {
                           int  newQuantity = (cartItems.itemQuantity ?? 1) - 1 ;
                           onUpdate(newQuantity) ;

                          }else {
                            showMyDialog(context,'Minimum quantity is 1' , DialogType.error) ;
                          }
                        } ,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5) ,
                            color: AppColors.backgroundColor
                          ),
                          child:const  Icon(Icons.remove , color: AppColors.darkColor,),
                        ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(right: 5 , left: 5),
                        child: Text( (cartItems.itemQuantity ?? 1 ).toString(), style: TextStyles.textStyle18,),
                      ) ,
                      GestureDetector(
                        onTap : (){
                          if((cartItems.itemQuantity ?? 1) < (cartItems.itemProductStock ?? 1)) {
                            int  newQuantity = (cartItems.itemQuantity ?? 1) + 1 ;
                            onUpdate(newQuantity) ;
                          }else{
                            showMyDialog(context, 'Out of stock' ,DialogType.error ) ;
                          }
                        } ,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5) ,
                              color: AppColors.backgroundColor
                          ),
                          child:const  Icon(Icons.add , color: AppColors.darkColor,),
                        ),
                      ) ,
                      const Spacer(),
                      Text(
                        'Total: \$${(cartItems.itemTotal ?? 1).toStringAsFixed(0)}',
                        style: TextStyles.textStyle16,
                      ),

                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

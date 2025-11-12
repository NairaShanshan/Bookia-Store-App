import 'package:bookia_store_app/core/constants/app_images.dart';
import 'package:bookia_store_app/core/routes/navigations.dart';
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/text_styles.dart';
import 'package:bookia_store_app/core/widgets/showdialog.dart';
import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:bookia_store_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_store_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/elevated_button.dart';
import '../../data/models/governorate/governorate_list.dart';

class PlaceOrderScreen extends StatelessWidget {
 const  PlaceOrderScreen({super.key,required this.total});


  final  String total ;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>() ;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: (){
            pop(context);
          },
            child: SvgPicture.asset(AppImages.backSvg)),
      ),
      body: BlocListener<CartCubit , CartStates>(
        listener: (context , state) {
          if(state is CheckoutLoadingState) {
            showLoadingDialog(context) ;
          }else if(state is CheckoutSuccessState) {
            pushToBase(context, Routes.submitOrder ) ;
          }else{
            if(state is CheckoutErrorState) {
              pop(context);
              showMyDialog(context, 'SomeThing went Wrong', DialogType.error) ;
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Place Your Order',
                    style: TextStyles.textStyle30,
                  ),
                  const Gap(10),
                  Text(
                    'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                    style:
                        TextStyles.textStyle16.copyWith(color: AppColors.greyColor),
                  ),
                  const Gap(20),
                  MyTextFormField(
                      hintText: 'Full Name',
                      validateMessage: 'Please Enter Your Name',
                      controller: cubit.nameController,
                      keyboardType: TextInputType.text),
                  const Gap(10),
                  MyTextFormField(
                      hintText: 'Email',
                      validateMessage: 'Please Enter Your Email',
                      controller: cubit.emailController,
                      keyboardType: TextInputType.emailAddress),
                  const Gap(10),
                  MyTextFormField(
                      hintText: 'Address',
                      validateMessage: 'Please Enter Your Address',
                      controller: cubit.addressController,
                      keyboardType: TextInputType.streetAddress),
                  const Gap(10),
                  MyTextFormField(
                      hintText: 'Phone',
                      validateMessage: 'Please Enter Your Phone',
                      controller: cubit.phoneController,
                      keyboardType: TextInputType.phone),
                  const Gap(10),
                  MyTextFormField(
                    hintText: 'Governorate',
                    readOnly: true ,
                    validateMessage: 'Please Enter Your Governorate',
                    controller: cubit.governorateController,
                    keyboardType: TextInputType.text,
                    suffixIcon: const  Icon(Icons.keyboard_arrow_down, color: AppColors.primaryColor,),
                    onTap: (){
                      selectGovernorate(context , cubit) ;
                    },

                  ),
                  const Gap(40),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total : ' , style: TextStyles.textStyle18,) ,
                            Text( '\$${double.tryParse(total)?.toStringAsFixed(0)}' , style: TextStyles.textStyle18,) ,
                          ],
                        ) ,
                        const Gap(20),
                        MyElevatedButton(onPressed: () {
                          if(cubit.formkey.currentState!.validate()){
                            cubit.placeOrder() ;
                          }

                        }, text: 'Submit Order') ,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> selectGovernorate(BuildContext context , CartCubit cubit) {
  return showModalBottomSheet(context: context, builder: (context ) {
    return Container(
      padding:const  EdgeInsets.all(20),
      decoration:const  BoxDecoration(
        borderRadius: BorderRadius.only(topRight:  Radius.circular(20) , topLeft: Radius.circular(20)) ,
        color: AppColors.backgroundColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Governorate ' , style: TextStyles.textStyle20,) ,
          const Gap(10) ,
          Expanded(
            child: ListView.separated(itemBuilder: (context , index) {
              return ListTile(
                onTap: () {
                  pop(context);
                  cubit.selectedGovId = governorateList[index].id ?? 0 ;
                  cubit.governorateController.text = governorateList[index].governorateNameEn ??'' ;
                },
                leading:const  Icon(Icons.location_on),
                title: Text(
                  governorateList[index].governorateNameEn ?? '',
                  style: TextStyles.textStyle16,
                ),
                trailing:const  Icon(Icons.arrow_forward_ios),
              );
            },
                separatorBuilder: (context , index) =>const  Divider(),
                itemCount: governorateList.length),
          )
        ]
        ,
      ),
    );
  }) ;
}



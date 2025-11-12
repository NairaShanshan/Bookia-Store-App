import 'package:bookia_store_app/features/cart/data/models/requests/place_order_params.dart';
import 'package:bookia_store_app/features/cart/data/repo/cart_repo.dart';
import 'package:bookia_store_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cart_response/cart_response.dart';



class CartCubit extends Cubit<CartStates> {
  CartCubit() :super(CartInitialState()) ;

  CartResponse? cartResponse;
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final addressController = TextEditingController();

  final phoneController = TextEditingController();

  final governorateController = TextEditingController();

  final formkey = GlobalKey<FormState>() ;

  int selectedGovId = -1 ;

  getCart()async{
    emit(CartLoadingState()) ;
    var res =await CartRepo.getCart() ;
    if(res != null) {
      cartResponse = res ;
      emit(CartSuccessState());
    }else{
      emit(CartErrorState());
    }

  }

  removeFromCart({ required int id }) async{
    emit(CartLoadingState());
    var res = await CartRepo.removeFromCart(id: id) ;
    if(res != null) {
      cartResponse =res ;
      emit(CartSuccessState()) ;
    }else{
      emit(CartErrorState()) ;
    }
  }
  
  updateCart({required int cartItemId , required int itemQuantity}) async{
    

    var res = await CartRepo.updateCart(cartItemId: cartItemId, itemQuantity: itemQuantity);
    if(res != null ){
      cartResponse = res ;
      emit(CartSuccessState()) ;
    }else{
      emit(CartErrorState()) ;
    }


  }

  checkout() async{
    emit(CheckoutLoadingState());
    var res = await CartRepo.checkout() ;
    if(res ) {
      emit(CheckoutSuccessState());
    }else{
      emit(CheckoutErrorState()) ;
    }
  }

  placeOrder() async {
    emit(CheckoutLoadingState());
    var params= PlaceOrderParams(
      governorateId: selectedGovId ,
      name: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      email: emailController.text
    );
    var res = await CartRepo.placeOrder(params) ;
    if(res ) {
      emit(CheckoutSuccessState());
    }else{
      emit(CheckoutErrorState());
    }
  }



}
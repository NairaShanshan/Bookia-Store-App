


import 'package:bookia_store_app/features/cart/data/repo/cart_repo.dart';
import 'package:bookia_store_app/features/home/data/repo/home_repo.dart';
import 'package:bookia_store_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../wishlist/data/repo/wishlist_repo.dart';
import '../../data/models/response/best_seller_response/BestSellerResponse.dart';
import '../../data/models/response/slider_response/slider_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(InitialHomeState()) ;

   List<SliderItem> sliders = [];
  List<Product>  products = [];


   // getSlider() async {
   //   emit(LoadingHomeState()) ;
   //
   //   var res = await   HomeRepo.getSlider() ;
   //   if(res != null) {
   //     sliders = res.data?.sliders ?? [] ;
   //     emit(SuccessHomeState()) ;
   //   }else{
   //     emit(ErrorHomeState()) ;
   //   }
   // }
   //
   //
   //
   // getBestSeller() async {
   //    emit(LoadingHomeState()) ;
   //   var res = await HomeRepo.getBestSeller() ;
   //   if(res != null ) {
   //     products = res.data?.products ?? [] ;
   //     emit(SuccessHomeState()) ;
   //   }else{
   //     emit(ErrorHomeState()) ;
   //   }
   //
   //
   // }


  /*
  * we do getInitData() method to replace the work of two method getSlider() ,  getBestSeller()
  *  to load the data in parallel (in the same time ) to avoid late of loading of one of them  */

   getInitData() async{

     emit(LoadingHomeState()) ;

     try {
       var results = await Future.wait(
        [ HomeRepo.getSlider() ,
          HomeRepo.getBestSeller()
        ]
       ) ;

       var sliderRes = results[0] as SliderResponse? ;
       var bestSellerRes = results[1] as BestSellerResponse? ;

       if(sliderRes != null || bestSellerRes != null ) {
         sliders = sliderRes?.data?.sliders ?? [] ;
         products = bestSellerRes?.data?.products ?? [] ;
         emit(SuccessHomeState()) ;
       }
       else{
         emit(ErrorHomeState()) ;
       }
     } on Exception catch (_) {
       emit(ErrorHomeState()) ;
     }

   }


  addToWishList({required int id} ) async {
    emit(LoadingHomeState()) ;
    var res =await WishListRepo.addToWishList(id: id) ;
    if(res != null) {
      emit(SuccessHomeState(message: 'Added to wishlist')) ;
    }else{
      emit(ErrorHomeState()) ;
    }
  }

  addToCart({required int id })async{
     emit(LoadingHomeState()) ;
     var res = await CartRepo.addToCart(id: id) ;
     if(res != null) {
       emit(SuccessHomeState(message: 'Added To Cart ')) ;
     }
     else{
       emit(ErrorHomeState()) ;
     }
  }



}
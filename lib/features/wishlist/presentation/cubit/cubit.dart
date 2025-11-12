
import 'package:bookia_store_app/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia_store_app/features/wishlist/presentation/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/response/best_seller_response/BestSellerResponse.dart';

class WishListCubit extends Cubit<WishListStates> {

  WishListCubit() : super(WishListInitState()) ;

  List<Product> products = [];

  getWishList () async{
    emit(WishListLoadingState()) ;
    var res =await  WishListRepo.getWishlist() ;
    if(res != null) {
      products =res.data?.data ?? [] ;
      emit(WishListSuccessState()) ;
    }else{
      emit(WishListErrorState()) ;
    }
  }

  removeFromWishList({
    required int id
}) async{
    emit(WishListLoadingState()) ;
    var res = await WishListRepo.removeFromWishList(id: id) ;
    if(res != null  ) {
      products= res.data?.data ?? [] ;
      emit(WishListSuccessState()) ;

    }else{
      emit(WishListErrorState()) ;
    }
  }




}
import 'package:bookia_store_app/features/home/data/models/response/best_seller_response/BestSellerResponse.dart';
import 'package:bookia_store_app/features/search/data/repo/search_repo.dart';
import 'package:bookia_store_app/features/search/presentation/cubit/search_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {

  SearchCubit() : super(InitialSearchState()) ;

   final  searchController = TextEditingController() ;
   List<Product> searchList = [] ;

  search() async {
    emit(LoadingSearchState()) ;
    var res = await SearchRepo.search(searchText: searchController.text.trim()) ;
    if (res!= null) {
      searchList = res.data?.products ?? [];
      emit(SuccessSearchState()) ;
    }else{
      emit(ErrorSearchState()) ;
    }
  }

  void clearSearch() {
    searchList = [];
    emit(InitialSearchState());
  }

}
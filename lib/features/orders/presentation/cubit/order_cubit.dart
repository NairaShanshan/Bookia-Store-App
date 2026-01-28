import 'package:bookia_store_app/features/orders/data/models/response/order_response.dart';
import 'package:bookia_store_app/features/orders/data/repo/orders_repo.dart';
import 'package:bookia_store_app/features/orders/presentation/cubit/order_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderStates> {

  OrderCubit () : super(InitialOrderState()) ;

  List<OrderResponse> orders  = [];

  orderHistory() async{

    emit(OrderLoadingState()) ;
    var res = await OrdersRepo.ordersHistory() ;
    if(res != null) {
      orders = res ;
      emit( OrderSuccessState());
    }else{
      emit(OrderErrorState()) ;
    }
  }
}
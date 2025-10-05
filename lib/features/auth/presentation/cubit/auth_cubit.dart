import 'package:bookia_store_app/features/auth/data/models/requests/auth_params.dart';
import 'package:bookia_store_app/features/auth/data/repo/auth_repo.dart';
import 'package:bookia_store_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {

  AuthCubit () : super(AuthInitialState()) ;

  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController()  ;
  final TextEditingController confirmPasswordController = TextEditingController()  ;

  register() async {

    emit(AuthLoadingState());

    var params = AuthParameters(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: confirmPasswordController.text,
    );

    var res = await AuthRepo.register(params) ;
    if(res != null){
      emit(AuthSuccessState()) ;
    }else {
      emit(AuthErrorState()) ;
    }
  }

  login() async {
    emit(AuthLoadingState());

    var params = AuthParameters(
      email: emailController.text,
      password: passwordController.text,
    );

    var res = await AuthRepo.login(params);

    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }


}


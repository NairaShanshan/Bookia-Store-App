import 'package:bookia_store_app/features/profile/data/models/requests/reset_password_params.dart';
import 'package:bookia_store_app/features/profile/data/models/requests/update_params.dart';
import 'package:bookia_store_app/features/profile/data/models/response/profile_response.dart';
import 'package:bookia_store_app/features/profile/data/repo/profile_repo.dart';
import 'package:bookia_store_app/features/profile/presentation/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local/shared_pref.dart';



class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialProfileState()) ;

  ProfileResponse ? userModel ;

  final nameController = TextEditingController() ;
  final phoneController = TextEditingController() ;
  final addressController = TextEditingController() ;


  var formKey = GlobalKey<FormState>();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final newPasswordConfirmation = TextEditingController();

  getProfile()async{
    emit(LoadingProfileState());
    var res = await ProfileRepo.getProfile() ;
    if(res!=null){
      userModel = res ;
      emit(SuccessProfileState());
    }
    else{
      emit(ErrorProfileState()) ;
    }
  }

  initData() {
    var userData = SharedPref.getUserData();
    nameController.text = userData?.name ?? '';
    addressController.text = userData?.address ?? '';
    phoneController.text = userData?.phone ?? '';
  }


  updateProfile() async {
    if (!formKey.currentState!.validate()) return;
    emit(LoadingProfileState()) ;

    var params = UpdateProfileParams(
      name: nameController.text ,
      phone: phoneController.text ,
      address: addressController.text
    ) ;
    var res = await ProfileRepo.updateProfile(params) ;
    if( res ){
      emit(SuccessProfileState());
    }else{
      emit(ErrorProfileState()) ;
    }
  }



  resetPassword() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoadingProfileState());

    var params = ChangePasswordParams(
      currentPassword: currentPassword.text,
      newPassword: newPassword.text,
      newPasswordConfirmation: newPasswordConfirmation.text,
    );

    try {
      await ProfileRepo.resetPassword(params);
      emit(SuccessProfileState());
    } catch (e) {

      emit(ErrorProfileState(e.toString().replaceFirst('Exception: ', '')));

    }
  }








}
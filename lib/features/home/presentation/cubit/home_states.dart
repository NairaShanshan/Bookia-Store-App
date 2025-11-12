class HomeStates {}

class InitialHomeState extends HomeStates{}

class LoadingHomeState extends HomeStates{}

class SuccessHomeState extends HomeStates{
  String? message ;
  SuccessHomeState({this.message}) ;
}

class ErrorHomeState extends HomeStates{}

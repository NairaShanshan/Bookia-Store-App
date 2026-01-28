class ProfileStates{}
class InitialProfileState extends ProfileStates {}
class LoadingProfileState extends ProfileStates {}
class SuccessProfileState extends ProfileStates {}

class ErrorProfileState extends ProfileStates {
  final String? message; // nullable
  ErrorProfileState([this.message]); // optional
}


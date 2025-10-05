class AuthParameters {
  String? name;

  String? email;

  String? password;

  String? passwordConfirmation;

  AuthParameters(
      {this.name, this.email, this.password, this.passwordConfirmation});

  factory AuthParameters.fromJson(Map<String, dynamic> json) {
    return AuthParameters(
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        passwordConfirmation: json['password_confirmation'] as String?);
  }


  Map<String , dynamic> toJson (){
    return {
      'name' : name ,
      'email' : email ,
      'password' : password ,
      'password_confirmation' : passwordConfirmation

    } ;
  }
}




import 'package:flutter_application_5/core/networking/error_model.dart';

class AuthState{}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {}
class LoginFailedState extends AuthState {
  final ApiErrorModel apiErrorModel  ;

  LoginFailedState(this.apiErrorModel);
}

class RegisterLoadingState  extends AuthState {}
class RegisterSuccessState extends AuthState {}
class RegisterFailedState extends AuthState {
  final ApiErrorModel apiErrorModel  ;

  RegisterFailedState(this.apiErrorModel);
}
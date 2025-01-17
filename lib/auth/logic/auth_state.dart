import 'package:flutter_application_5/core/networking/error_model.dart';

class AuthState {}

class AuthInitialState extends AuthState {}


class AuthLoadingState  extends AuthState {}
class AuthSuccessState extends AuthState {}
class AuthErrorState extends AuthState {
  final ApiErrorModel apiErrorModel ;

  AuthErrorState(this.apiErrorModel);
}
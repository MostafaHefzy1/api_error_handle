import 'package:flutter_application_5/core/networking/error_model.dart';

class HomeState {}

class HomeInitialState extends HomeState {}


class HomeSuccessState extends HomeState {}
class HomeFailureState extends HomeState {
  final ApiErrorModel apiErrorModel ;

  HomeFailureState(this.apiErrorModel); 
}
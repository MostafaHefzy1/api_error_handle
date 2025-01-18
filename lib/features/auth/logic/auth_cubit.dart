import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_5/core/networking/dio_helper.dart';
import 'package:flutter_application_5/core/sharedpreference.dart';
import 'package:flutter_application_5/features/auth/data/models/login_request_body_model.dart';
import 'package:flutter_application_5/features/auth/data/models/register_request_model.dart';
import 'package:flutter_application_5/features/auth/ui/register_screen.dart';
import 'package:flutter_application_5/features/home/ui/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_5/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_application_5/features/auth/logic/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void login(LoginRequestBodyModel loginRequestBodyModel, context) async {
    emit(LoginLoadingState());
    var result = await _authRepository.login(loginRequestBodyModel);

    result.when(success: (value) {
      saveTokenAfterAuth(value.accessToken!, context);

      emit(LoginSuccessState());
    }, failure: (apiErrorModel) {
      emit(LoginFailedState(apiErrorModel));
    });
  }

  void register(RegisterRequestModel registerRequestModel, context) async {
    emit(RegisterLoadingState());
    var result = await _authRepository.register(registerRequestModel);
    result.when(success: (value) {
      saveTokenAfterAuth(value.accessToken!, context);
      emit(RegisterSuccessState());
    }, failure: (erorr) {
      emit(RegisterFailedState(erorr));
    });
  }

  void saveTokenAfterAuth(String token, context) async {
    CacheHelper.saveData(key: "token", value: token);
    await DioHelper.initDioHelper();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}

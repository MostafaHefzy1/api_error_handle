import 'package:flutter/widgets.dart';
import 'package:flutter_application_5/auth/data/models/login_requst_body.dart';
import 'package:flutter_application_5/auth/data/repository/auth_repositoy.dart';
import 'package:flutter_application_5/auth/logic/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoy _authRepositoy;
  AuthCubit(this._authRepositoy) : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void login(LoginRequstBody loginRequstBody) async {
    emit(AuthLoadingState());
    var result = await _authRepositoy.login(loginRequstBody);
    result.when(success: (value) {
      emit(AuthSuccessState());
    }, failure: (error) {
      emit(AuthErrorState(error));
    });
  }
}

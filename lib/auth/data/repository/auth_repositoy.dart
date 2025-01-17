import 'package:flutter_application_5/auth/data/models/login_model.dart';
import 'package:flutter_application_5/auth/data/models/login_requst_body.dart';
import 'package:flutter_application_5/auth/data/web_services/auth_web_services.dart';
import 'package:flutter_application_5/core/networking/api_error_handler.dart';
import 'package:flutter_application_5/core/networking/api_result.dart';

class AuthRepositoy {
  final AuthWebServices _authWebServices;

  AuthRepositoy(this._authWebServices);

  Future<ApiResult<LoginModel>> login(LoginRequstBody loginRequstBody) async {
    try {
      final response = await _authWebServices.login(loginRequstBody);
      return ApiResult.success(LoginModel.fromJson(response));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

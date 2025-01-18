import 'package:flutter_application_5/core/networking/api_error_handler.dart';
import 'package:flutter_application_5/core/networking/api_result.dart';
import 'package:flutter_application_5/features/auth/data/models/auth_model.dart';
import 'package:flutter_application_5/features/auth/data/models/login_request_body_model.dart';
import 'package:flutter_application_5/features/auth/data/models/register_request_model.dart';
import 'package:flutter_application_5/features/auth/data/web_services/auth_web_services.dart';

class AuthRepository {
  final AuthWebServices _authWebServices;

  AuthRepository(this._authWebServices);

  Future<ApiResult<AuthModel>> login(
      LoginRequestBodyModel loginRequestBodyModel) async {
    try {
      var response = await _authWebServices.login(loginRequestBodyModel);
      return ApiResult.success(AuthModel.fromJson(response));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AuthModel>> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      var response = await _authWebServices.register(registerRequestModel);
      return ApiResult.success(AuthModel.fromJson(response));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

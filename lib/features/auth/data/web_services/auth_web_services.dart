import 'package:flutter_application_5/core/networking/dio_helper.dart';
import 'package:flutter_application_5/features/auth/data/models/login_request_body_model.dart';
import 'package:flutter_application_5/features/auth/data/models/register_request_model.dart';

class AuthWebServices {
  Future<dynamic> login(LoginRequestBodyModel loginRequestBodyModel) async {
    var response = await DioHelper.postData(
        endpoint: "auth/login", data: loginRequestBodyModel.toJson());
    return response.data;
  }

  Future<dynamic> register(RegisterRequestModel registerRequestModel) async {
    var response = await DioHelper.postData(
        endpoint: "auth/register", data: registerRequestModel.toJson());
    return response.data;
  }
}

import 'package:flutter_application_5/auth/data/models/login_requst_body.dart';
import 'package:flutter_application_5/core/networking/dio_helper.dart';

class AuthWebServices {
  Future<dynamic> login(LoginRequstBody loginRequstBody) async {
    var response = await DioHelper.postData(
        endpoint: "auth/login", data: loginRequstBody.toJson());
    return response.data;
  }
}

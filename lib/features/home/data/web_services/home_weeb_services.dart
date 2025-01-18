
import 'package:flutter_application_5/core/networking/dio_helper.dart';

class HomeWeebServices {
  Future<dynamic> getToDos(int page) async {
    var response = await DioHelper.getData(endpoint: "todos" , queryParameters: {
      'page': page,
    });
    return response.data;
  }
}

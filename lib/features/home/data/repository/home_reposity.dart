import 'package:flutter_application_5/core/networking/api_error_handler.dart';
import 'package:flutter_application_5/core/networking/api_result.dart';

import 'package:flutter_application_5/features/home/data/models/todo_model.dart';
import 'package:flutter_application_5/features/home/data/web_services/home_weeb_services.dart';

class HomeReposity {
  final HomeWeebServices _homeWeebServices;

  HomeReposity(this._homeWeebServices);

  Future<ApiResult<List<ToDoItem>>> getToDos(int page) async {
    try {
      List response = await _homeWeebServices.getToDos(page);
      return ApiResult.success(response.map((e) => ToDoItem.fromJson(e)).toList());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

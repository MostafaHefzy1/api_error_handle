import 'package:dio/dio.dart';
import 'package:flutter_application_5/core/networking/api_const.dart';
import 'package:flutter_application_5/core/sharedpreference.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConst.baseUrl,
        receiveDataWhenStatusError: true,
        
        headers: {
          'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}',
          "lang": "en"
        }));

    dio!.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }

  static Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    return await dio!.get(
      endpoint,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postData(
      {required String endpoint, Map<String, dynamic>? data}) async {
    return await dio!.post(endpoint, data: data);
  }
}

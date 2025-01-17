import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String? message;
  String? error;
  int? statusCode;

  ApiErrorModel({this.message, this.error, this.statusCode});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}

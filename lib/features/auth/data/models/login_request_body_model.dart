import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_body_model.g.dart';

@JsonSerializable()
class LoginRequestBodyModel {
  final String phone;
  final String password;

  LoginRequestBodyModel({required this.phone, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyModelToJson(this);
}

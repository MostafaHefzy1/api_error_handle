// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestBodyModel _$LoginRequestBodyModelFromJson(
        Map<String, dynamic> json) =>
    LoginRequestBodyModel(
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestBodyModelToJson(
        LoginRequestBodyModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };

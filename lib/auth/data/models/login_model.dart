import 'package:json_annotation/json_annotation.dart';


part 'login_model.g.dart';
@JsonSerializable()
class LoginModel {
  @JsonKey(name: "_idƒ")
  String? sId;

  @JsonKey(name: "access_token")
  String? accessToken;
  @JsonKey(name: "refresh_token")
  String? refreshToken;

  LoginModel({this.sId, this.accessToken, this.refreshToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

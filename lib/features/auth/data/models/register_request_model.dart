import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  final String phone;
  final String password;
  final String displayName;
  final String experienceYears;
  final String address;
  final String level;

  RegisterRequestModel(
      {required this.phone,
      required this.password,
      required this.displayName,
      required this.experienceYears,
      required this.address,
      required this.level});

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}

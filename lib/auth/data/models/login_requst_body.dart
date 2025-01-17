import 'package:json_annotation/json_annotation.dart';
part 'login_requst_body.g.dart';

@JsonSerializable()
class LoginRequstBody {
  final String phone;
  final String password;

  LoginRequstBody({required this.phone, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequstBodyToJson(this);
}

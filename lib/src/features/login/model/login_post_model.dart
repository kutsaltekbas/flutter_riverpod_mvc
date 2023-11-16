import 'package:json_annotation/json_annotation.dart';

part 'login_post_model.g.dart';

@JsonSerializable()
class LoginPostModel {
  String? email;
  String? password;

  LoginPostModel({this.email, this.password});

  LoginPostModel fromJson(Map<String, dynamic> json) {
    return _$LoginPostModelFromJson(json);
  }

  @override
  factory LoginPostModel.fromJson(Map<String, dynamic> json) {
    return _$LoginPostModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginPostModelToJson(this);
  }
}

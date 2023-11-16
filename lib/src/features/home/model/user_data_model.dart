import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  int? page;
  @JsonKey(name: 'per_page')
  int? perPage;

  int? total;
  @JsonKey(name: 'total_pages')
  int? totalPages;

  List<UserInfoModel?>? data;

  UserDataModel(
      {this.data, this.page, this.perPage, this.total, this.totalPages});

  UserDataModel fromJson(Map<String, dynamic> json) {
    return _$UserDataModelFromJson(json);
  }

  @override
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return _$UserDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDataModelToJson(this);
  }
}

@JsonSerializable()
class UserInfoModel {
  int? id;
  String? email;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? avatar;
  UserInfoModel(
      {this.id, this.firstName, this.lastName, this.email, this.avatar});

  UserInfoModel fromJson(Map<String, dynamic> json) {
    return _$UserInfoModelFromJson(json);
  }

  @override
  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return _$UserInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoModelToJson(this);
  }
}

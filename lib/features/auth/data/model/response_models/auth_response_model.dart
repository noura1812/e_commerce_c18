import 'package:e_commerce_c18/features/auth/domain/entity/user_entity.dart';

class AuthResponseModel {
  String? message;
  UserResponseModel? user;
  String? token;

  AuthResponseModel({this.message, this.user, this.token});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : UserResponseModel.fromJson(json["user"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  static List<AuthResponseModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(AuthResponseModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class UserResponseModel {
  String? name;
  String? email;
  String? role;

  UserResponseModel({this.name, this.email, this.role});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }

  static List<UserResponseModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserResponseModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["role"] = role;
    return _data;
  }

  UserEntity toDomain() {
    return UserEntity(email: email, name: name);
  }
}

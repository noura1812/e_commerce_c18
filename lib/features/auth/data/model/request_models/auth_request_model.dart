class AuthRequestModel {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  AuthRequestModel({this.name, this.email, this.password, this.rePassword, this.phone});

  Map<String, dynamic> toLogin() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;

    return _data;
  }

  Map<String, dynamic> toSignup() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["password"] = password;
    _data["rePassword"] = rePassword;
    _data["phone"] = phone;
    return _data;
  }
}

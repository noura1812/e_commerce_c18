import 'package:e_commerce_c18/features/auth/data/model/request_models/auth_request_model.dart';

class UserEntity {
  String? email;
  String? id;
  String? name;
  String? password;
  String? phoneNumber;
  UserEntity({this.email, this.id, this.name, this.password, this.phoneNumber});
  AuthRequestModel toRequest() {
    return AuthRequestModel(
      email: email,
      name: name,
      password: password,
      phone: phoneNumber,
      rePassword: password,
    );
  }
}

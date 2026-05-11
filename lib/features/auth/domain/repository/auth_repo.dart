import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<CustomResponse<UserEntity>> login(UserEntity user);
  Future<CustomResponse<UserEntity>> signup(UserEntity user);
}

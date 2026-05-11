import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_c18/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final AuthRepo _authRepo;

  LoginUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;
  Future<CustomResponse<UserEntity>> call(UserEntity user) async => await _authRepo.login(user);
}

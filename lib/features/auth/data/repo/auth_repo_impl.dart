import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/resources/constants_manager.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/core/services/secured_storage_service.dart';
import 'package:e_commerce_c18/features/auth/data/data_source/auth_data_source.dart';
import 'package:e_commerce_c18/features/auth/data/model/response_models/auth_response_model.dart';
import 'package:e_commerce_c18/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_c18/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;
  final SecuredStorageService _securedStorageService;
  AuthRepoImpl(this._securedStorageService, {required AuthDataSource authDataSource})
    : _authDataSource = authDataSource;
  @override
  Future<CustomResponse<UserEntity>> login(UserEntity user) async {
    try {
      AuthResponseModel responseModel = await _authDataSource.login(user.toRequest());
      _securedStorageService.saveString(key: AppConstants.tokenKey, value: responseModel.token!);
      return Success(data: responseModel.user!.toDomain());
    } catch (e) {
      return ErrorModel.handelError<UserEntity>(e);
    }
  }

  @override
  Future<CustomResponse<UserEntity>> signup(UserEntity user) async {
    try {
      AuthResponseModel responseModel = await _authDataSource.signup(user.toRequest());
      _securedStorageService.saveString(key: AppConstants.tokenKey, value: responseModel.token!);
      return Success(data: responseModel.user!.toDomain());
    } catch (e) {
      return ErrorModel.handelError<UserEntity>(e);
    }
  }
}

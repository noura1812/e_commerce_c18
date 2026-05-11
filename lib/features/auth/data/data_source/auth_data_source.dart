import 'package:dio/dio.dart';
import 'package:e_commerce_c18/core/network/endpoints.dart';
import 'package:e_commerce_c18/features/auth/data/model/request_models/auth_request_model.dart';
import 'package:e_commerce_c18/features/auth/data/model/response_models/auth_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<AuthResponseModel> login(AuthRequestModel user);
  Future<AuthResponseModel> signup(AuthRequestModel user);
}

@Injectable(as: AuthDataSource)
class AuthNetworkDataSource implements AuthDataSource {
  final Dio _dio;

  AuthNetworkDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<AuthResponseModel> login(AuthRequestModel user) async {
    Response response = await _dio.post(Endpoints.login, data: user.toLogin());
    AuthResponseModel responseModel = AuthResponseModel.fromJson(response.data);

    if (responseModel.message == 'success') {
      return responseModel;
    } else {
      throw responseModel.message ?? 'something went wrong ';
    }
  }

  @override
  Future<AuthResponseModel> signup(AuthRequestModel user) async {
    Response response = await _dio.post(Endpoints.signup, data: user.toSignup());
    AuthResponseModel responseModel = AuthResponseModel.fromJson(response.data);

    if (responseModel.message == 'success') {
      return responseModel;
    } else {
      throw responseModel.message ?? 'something went wrong ';
    }
  }
}

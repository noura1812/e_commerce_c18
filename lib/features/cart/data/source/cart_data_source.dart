import 'package:dio/dio.dart';
import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/network/endpoints.dart';
import 'package:e_commerce_c18/core/resources/constants_manager.dart';
import 'package:e_commerce_c18/core/services/secured_storage_service.dart';
import 'package:e_commerce_c18/features/cart/data/model/cart_response.dart';
import 'package:injectable/injectable.dart';

abstract class CartDataSource {
  Future<CartResponse> getCart();
  Future addProductToCart(String productId);
  Future removeProductFromCart(String productId);
  Future updateProductInCart(String productId, int count);
}

@Injectable(as: CartDataSource)
class CartDataSourceImpl implements CartDataSource {
  final Dio _dio;
  final SecuredStorageService _securedStorageService;

  CartDataSourceImpl({required Dio dio, required SecuredStorageService securedStorageService})
    : _dio = dio,
      _securedStorageService = securedStorageService;
  @override
  Future<void> addProductToCart(String productId) async {
    String? token = await _securedStorageService.getString(key: AppConstants.tokenKey);
    Response response = await _dio.post(
      Endpoints.cart,
      data: {'productId': productId},
      options: Options(headers: {'token': token}),
    );
    if (response.data['status'] == 'success') {
      return;
    }
    throw GeneralError(response.data['message'] ?? 'something went wrong');
  }

  @override
  Future<CartResponse> getCart() async {
    String? token = await _securedStorageService.getString(key: AppConstants.tokenKey);
    Response response = await _dio.get(Endpoints.cart, options: Options(headers: {'token': token}));
    CartResponse cartResponse = CartResponse.fromJson(response.data);
    if (cartResponse.status == "success") {
      return cartResponse;
    }
    throw GeneralError(response.data['message'] ?? 'something went wrong');
  }

  @override
  Future removeProductFromCart(String productId) async {
    String? token = await _securedStorageService.getString(key: AppConstants.tokenKey);
    Response response = await _dio.delete(
      '${Endpoints.cart}/$productId',
      options: Options(headers: {'token': token}),
    );
    if (response.data['status'] == 'success') {
      return;
    }
    throw GeneralError(response.data['message'] ?? 'something went wrong');
  }

  @override
  Future updateProductInCart(String productId, int count) async {
    String? token = await _securedStorageService.getString(key: AppConstants.tokenKey);
    Response response = await _dio.put(
      '${Endpoints.cart}/$productId',
      data: {'count': count},
      options: Options(headers: {'token': token}),
    );
    if (response.data['status'] == 'success') {
      return;
    }
    throw GeneralError(response.data['message'] ?? 'something went wrong');
  }
}

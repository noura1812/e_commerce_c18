import 'package:dio/dio.dart';
import 'package:e_commerce_c18/core/network/endpoints.dart';
import 'package:e_commerce_c18/core/resources/constants_manager.dart';
import 'package:e_commerce_c18/core/services/secured_storage_service.dart';
import 'package:e_commerce_c18/features/products/data/models/request_models/products_filter_request_model.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/products_response_model.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/wishlist_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProductsDataSource {
  Future<ProductsResponseModel> getProductsWithFilter(ProductsFilterRequestModel filter);
  Future<WishlistResponseModel> getWishlist(); //TODO:
  Future<void> editWishlist(String productId, bool isAdd);
}

@Injectable(as: ProductsDataSource)
class ProductsRemoteDataSource implements ProductsDataSource {
  final Dio _dio;
  final SecuredStorageService _cashService;

  ProductsRemoteDataSource(this._cashService, {required Dio dio}) : _dio = dio;
  @override
  Future<ProductsResponseModel> getProductsWithFilter(ProductsFilterRequestModel filter) async {
    Response response = await _dio.get(Endpoints.products, queryParameters: filter.toJson());
    return ProductsResponseModel.fromJson(response.data);
  }

  @override
  Future<void> editWishlist(String productId, bool isAdd) async {
    String? token = await _cashService.getString(key: AppConstants.tokenKey);

    if (isAdd) {
      await _dio.post(
        Endpoints.wishlist,
        data: {"productId": productId},
        options: Options(headers: {'token': token}),
      );
    } else {
      await _dio.delete(
        Endpoints.wishlist + '/$productId',
        options: Options(headers: {'token': token}),
      );
    }
  }

  @override
  Future<WishlistResponseModel> getWishlist() async {
    String? token = await _cashService.getString(key: AppConstants.tokenKey);
    Response response = await _dio.get(
      Endpoints.wishlist,
      options: Options(headers: {'token': token}),
    );
    return WishlistResponseModel.fromJson(response.data);
  }
}

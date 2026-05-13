import 'package:dio/dio.dart';
import 'package:e_commerce_c18/core/network/endpoints.dart';
import 'package:e_commerce_c18/core/resources/constants_manager.dart';
import 'package:e_commerce_c18/core/services/secured_storage_service.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/products_response_model.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/wishlist_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProductsDataSource {
  Future<ProductsResponseModel> getProductsBySubCat(String subCatID);
  Future<WishlistResponseModel> getWishlist(); //TODO:
  Future<void> editWishlist(String productId, bool isAdd);
}

@Injectable(as: ProductsDataSource)
class ProductsRemoteDataSource implements ProductsDataSource {
  final Dio _dio;
  final SecuredStorageService _cashService;

  ProductsRemoteDataSource(this._cashService, {required Dio dio}) : _dio = dio;
  @override
  Future<ProductsResponseModel> getProductsBySubCat(String subCatID) async {
    Response response = await _dio.get(
      Endpoints.products, //, queryParameters: {'category': subCatID}
    );
    return ProductsResponseModel.fromJson(response.data);
  }

  @override
  Future<void> editWishlist(String productId, bool isAdd) {
    // TODO: implement editWishlist
    throw UnimplementedError();
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

import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/products/data/datasources/products_data_source.dart';
import 'package:e_commerce_c18/features/products/data/models/request_models/products_filter_request_model.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/products_response_model.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/wishlist_response_model.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/domain/entities/products_filter_entity.dart';
import 'package:e_commerce_c18/features/products/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsDataSource _productsDataSource;
  ProductsRepoImpl(this._productsDataSource);
  @override
  Future<CustomResponse<List<ProductEntity>>> getProductsWithFilters(
    ProductsFilterRequestModel filter,
  ) async {
    try {
      ProductsResponseModel response = await _productsDataSource.getProductsWithFilter(filter);
      return Success<List<ProductEntity>>(data: response.data ?? []);
    } catch (e) {
      return ErrorModel.handelError<List<ProductEntity>>(e);
    }
  }

  @override
  Future<CustomResponse<void>> editWishlist(String productId, bool isAdd) async {
    try {
      await _productsDataSource.editWishlist(productId, isAdd);
      return Success(data: null);
    } catch (e) {
      return ErrorModel.handelError<void>(e);
    }
  }

  @override
  Future<CustomResponse<List<ProductEntity>>> getWishlist() async {
    try {
      WishlistResponseModel response = await _productsDataSource.getWishlist();
      return Success(data: response.data ?? []);
    } catch (e) {
      return ErrorModel.handelError<List<ProductEntity>>(e);
    }
  }
}

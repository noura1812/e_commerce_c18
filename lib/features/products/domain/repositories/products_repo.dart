import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/domain/entities/products_filter_entity.dart';

abstract class ProductsRepo {
  Future<CustomResponse<List<ProductEntity>>> getProductsWithFilters(ProductsFilterEntity filter);
  Future<CustomResponse<List<ProductEntity>>> getWishlist();
  Future<CustomResponse<void>> editWishlist(String productId, bool isAdd);
}

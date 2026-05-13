import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/products/data/datasources/products_data_source.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/products_response_model.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsDataSource _productsDataSource;
  ProductsRepoImpl(this._productsDataSource);
  @override
  Future<CustomResponse<List<ProductEntity>>> getProductsBySubCat(String subCatId) async {
    try {
      ProductsResponseModel response = await _productsDataSource.getProductsBySubCat(subCatId);
      return Success<List<ProductEntity>>(data: response.data ?? []);
    } catch (e) {
      return ErrorModel.handelError<List<ProductEntity>>(e);
    }
  }
}

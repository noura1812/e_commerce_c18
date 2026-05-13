import 'package:dio/dio.dart';
import 'package:e_commerce_c18/core/network/endpoints.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/products_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProductsDataSource {
  Future<ProductsResponseModel> getProductsBySubCat(String subCatID);
}

@Injectable(as: ProductsDataSource)
class ProductsRemoteDataSource implements ProductsDataSource {
  final Dio _dio;

  ProductsRemoteDataSource({required Dio dio}) : _dio = dio;
  @override
  Future<ProductsResponseModel> getProductsBySubCat(String subCatID) async {
    Response response = await _dio.get(
      Endpoints.products, //, queryParameters: {'category': subCatID}
    );
    return ProductsResponseModel.fromJson(response.data);
  }
}

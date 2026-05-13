import 'package:dio/dio.dart';
import 'package:e_commerce_c18/core/network/endpoints.dart';
import 'package:e_commerce_c18/features/categories/data/models/response_models/categories_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class CategoriesDataSource {
  Future<CategoriesResponseModel> getCategories();
  Future<CategoriesResponseModel> getSubCategories(String catID);
}

@Injectable(as: CategoriesDataSource)
class CategoriesNetworkDataSource implements CategoriesDataSource {
  final Dio _dio;

  CategoriesNetworkDataSource({required Dio dio}) : _dio = dio;
  @override
  Future<CategoriesResponseModel> getCategories() async {
    Response response = await _dio.get(Endpoints.categories);
    return CategoriesResponseModel.fromJson(response.data);
  }

  @override
  getSubCategories(String catID) async {
    Response response = await _dio.get(Endpoints.subCategoriesOfCategory(catID));
    return CategoriesResponseModel.fromJson(response.data);
  }
}

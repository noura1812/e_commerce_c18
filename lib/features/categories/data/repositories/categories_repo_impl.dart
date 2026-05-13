import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/categories/data/datasources/categories_data_source.dart';
import 'package:e_commerce_c18/features/categories/data/models/response_models/categories_response_model.dart';
import 'package:e_commerce_c18/features/categories/domain/entities/category_entity.dart';
import 'package:e_commerce_c18/features/categories/domain/repositories/categories_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesDataSource _categoriesDataSource;

  CategoriesRepoImpl({required CategoriesDataSource categoriesDataSource})
    : _categoriesDataSource = categoriesDataSource;
  @override
  Future<CustomResponse<List<CategoryEntity>>> getCategories() async {
    try {
      CategoriesResponseModel response = await _categoriesDataSource.getCategories();
      return Success<List<CategoryEntity>>(data: response.data ?? []);
    } catch (e) {
      return ErrorModel.handelError<List<CategoryEntity>>(e);
    }
  }

  @override
  Future<CustomResponse<List<CategoryEntity>>> getSubCategories(String catID) async {
    try {
      CategoriesResponseModel response = await _categoriesDataSource.getSubCategories(catID);
      return Success<List<CategoryEntity>>(data: response.data ?? []);
    } catch (e) {
      return ErrorModel.handelError<List<CategoryEntity>>(e);
    }
  }
}

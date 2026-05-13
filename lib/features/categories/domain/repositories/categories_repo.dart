import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/categories/domain/entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<CustomResponse<List<CategoryEntity>>> getCategories();
  Future<CustomResponse<List<CategoryEntity>>> getSubCategories(String catID);
}

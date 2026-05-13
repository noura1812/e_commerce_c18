import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/categories/domain/entities/category_entity.dart';
import 'package:e_commerce_c18/features/categories/domain/repositories/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesUsecase {
  final CategoriesRepo _categoriesRepo;

  GetSubCategoriesUsecase({required CategoriesRepo categoriesRepo})
    : _categoriesRepo = categoriesRepo;
  Future<CustomResponse<List<CategoryEntity>>> call(String catID) =>
      _categoriesRepo.getSubCategories(catID);
}

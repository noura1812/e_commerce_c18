import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsBySubCatUsecase {
  final ProductsRepo _productsRepo;

  GetProductsBySubCatUsecase({required ProductsRepo productsRepo}) : _productsRepo = productsRepo;
  Future<CustomResponse<List<ProductEntity>>> call(String subCatID) =>
      _productsRepo.getProductsBySubCat(subCatID);
}

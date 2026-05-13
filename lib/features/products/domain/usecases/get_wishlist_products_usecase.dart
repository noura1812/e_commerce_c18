import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishlistProductsUsecase {
  final ProductsRepo _productsRepo;

  GetWishlistProductsUsecase({required ProductsRepo productsRepo}) : _productsRepo = productsRepo;
  Future<CustomResponse<List<ProductEntity>>> call() => _productsRepo.getWishlist();
}

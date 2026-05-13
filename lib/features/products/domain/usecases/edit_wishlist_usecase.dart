import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/products/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditWishlistUsecase {
  final ProductsRepo _productsRepo;

  EditWishlistUsecase({required ProductsRepo productsRepo}) : _productsRepo = productsRepo;

  Future<CustomResponse<void>> call(String productId, bool isAdd) =>
      _productsRepo.editWishlist(productId, isAdd);
}

import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProductInCartUsecase {
  final CartRepo _cartRepo;

  UpdateProductInCartUsecase({required CartRepo cartRepo}) : _cartRepo = cartRepo;

  Future<CustomResponse<void>> call(String productId, int count) =>
      _cartRepo.updateProductInCart(productId, count);
}

import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUsecase {
  final CartRepo _cartRepo;

  AddToCartUsecase({required CartRepo cartRepo}) : _cartRepo = cartRepo;

  Future<CustomResponse<void>> call(String productId) => _cartRepo.addToCart(productId);
}

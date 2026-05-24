import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/product_cart_entity.dart';
import 'package:e_commerce_c18/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUsecase {
  final CartRepo _cartRepo;

  GetCartUsecase({required CartRepo cartRepo}) : _cartRepo = cartRepo;

  Future<CustomResponse<CartEntity>> call() => _cartRepo.getCart();
}

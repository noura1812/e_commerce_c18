import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/product_cart_entity.dart';

abstract class CartRepo {
  Future<CustomResponse<CartEntity>> getCart();
  Future<CustomResponse<void>> addToCart(String productID);
  Future<CustomResponse<void>> removeFromCart(String productID);
  Future<CustomResponse<void>> updateProductInCart(String productID, int count);
}

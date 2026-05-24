import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/cart/data/model/cart_response.dart';
import 'package:e_commerce_c18/features/cart/data/source/cart_data_source.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/product_cart_entity.dart';
import 'package:e_commerce_c18/features/cart/domain/repo/cart_repo.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartDataSource _cartDataSource;

  CartRepoImpl({required CartDataSource cartDataSource}) : _cartDataSource = cartDataSource;
  @override
  Future<CustomResponse<void>> addToCart(String productID) async {
    try {
      await _cartDataSource.addProductToCart(productID);
      return Success(data: null);
    } catch (e) {
      return ErrorModel.handelError<void>(e);
    }
  }

  @override
  Future<CustomResponse<CartEntity>> getCart() async {
    try {
      CartResponse response = await _cartDataSource.getCart();
      CartEntity cart = CartEntity(
        totalCartPrice: response.data?.totalCartPrice?.toDouble(),
        products: response.data?.products ?? [],
        id: response.cartId,
      );
      return Success(data: cart);
    } catch (e) {
      return ErrorModel.handelError<CartEntity>(e);
    }
  }

  @override
  Future<CustomResponse<void>> removeFromCart(String productID) async {
    try {
      await _cartDataSource.removeProductFromCart(productID);
      return Success(data: null);
    } catch (e) {
      return ErrorModel.handelError<void>(e);
    }
  }

  @override
  Future<CustomResponse<void>> updateProductInCart(String productID, int count) async {
    try {
      await _cartDataSource.updateProductInCart(productID, count);
      return Success(data: null);
    } catch (e) {
      return ErrorModel.handelError<void>(e);
    }
  }
}

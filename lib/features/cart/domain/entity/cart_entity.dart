import 'package:e_commerce_c18/features/cart/domain/entity/product_cart_entity.dart';

class CartEntity {
  final double? totalCartPrice;
  final List<ProductCartEntity> products;
  final String? id;

  CartEntity({required this.totalCartPrice, required this.products, required this.id});
}

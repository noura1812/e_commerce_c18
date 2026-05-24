import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';

class ProductCartEntity {
  int? count;
  String? id;
  ProductEntity? product;
  int? price;
  ProductCartEntity({this.count, this.id, this.price, this.product});
}

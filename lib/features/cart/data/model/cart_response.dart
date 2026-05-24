import 'package:e_commerce_c18/features/cart/domain/entity/product_cart_entity.dart';
import 'package:e_commerce_c18/features/products/data/models/response_models/products_response_model.dart';

class CartResponse {
  String? status;
  int? numOfCartItems;
  String? cartId;
  CartListResponse? data;

  CartResponse({this.status, this.numOfCartItems, this.cartId, this.data});

  CartResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if (json["cartId"] is String) {
      cartId = json["cartId"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : CartListResponse.fromJson(json["data"]);
    }
  }

  static List<CartResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartResponse.fromJson).toList();
  }
}

class CartListResponse {
  String? id;
  String? cartOwner;
  List<ProductCartModel>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  CartListResponse({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  CartListResponse.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List).map((e) => ProductCartModel.fromJson(e)).toList();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
    if (json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }

  static List<CartListResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartListResponse.fromJson).toList();
  }
}

class ProductCartModel extends ProductCartEntity {
  ProductCartModel({super.count, super.id, super.product, super.price});

  ProductCartModel.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["product"] is Map) {
      product = json["product"] == null ? null : ProductModel.fromJson(json["product"]);
    }
    if (json["price"] is int) {
      price = json["price"];
    }
  }

  static List<ProductCartModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductCartModel.fromJson).toList();
  }
}

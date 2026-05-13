import 'package:e_commerce_c18/features/products/data/models/response_models/products_response_model.dart';

class WishlistResponseModel {
  String? status;
  int? count;
  List<ProductModel>? data;

  WishlistResponseModel({this.status, this.count, this.data});

  WishlistResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => ProductModel.fromJson(e)).toList();
    }
  }

  static List<WishlistResponseModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(WishlistResponseModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["count"] = count;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

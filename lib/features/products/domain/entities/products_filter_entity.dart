import 'package:e_commerce_c18/features/products/data/models/request_models/products_filter_request_model.dart';

class ProductsFilterEntity extends ProductsFilterRequestModel {
  ProductsFilterEntity({super.categoryId, super.page = 1, super.sort, super.text});

  ProductsFilterEntity copyWith({String? text, String? sort, String? categoryId, int? page}) {
    return ProductsFilterEntity(
      text: text ?? super.text,
      sort: sort ?? super.sort,
      categoryId: categoryId ?? super.categoryId,
      page: page ?? super.page,
    );
  }
}

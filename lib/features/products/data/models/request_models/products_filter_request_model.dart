class ProductsFilterRequestModel {
  final String? text;
  final String? sort;
  final String? categoryId;
  final int page;
  ProductsFilterRequestModel({this.categoryId, this.page = 1, this.sort = 'price', this.text});

  Map<String, dynamic> toJson() {
    return {
      if (sort != null) "sort": sort,
      if (text != null) "keyword": text,
      if (page != null) "page": page,
    };
  }
}

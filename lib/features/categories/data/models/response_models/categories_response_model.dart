import 'package:e_commerce_c18/features/categories/domain/entities/category_entity.dart';

class CategoriesResponseModel {
  int? results;
  Metadata? metadata;
  List<CategoryModel>? data;

  CategoriesResponseModel({this.results, this.metadata, this.data});

  CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["metadata"] is Map) {
      metadata = json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => CategoryModel.fromJson(e)).toList();
    }
  }

  static List<CategoriesResponseModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoriesResponseModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    if (metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class CategoryModel extends CategoryEntity {
  String? slug;
  String? createdAt;
  String? updatedAt;

  CategoryModel({super.id, super.name, this.slug, super.image, this.createdAt, this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  static List<CategoryModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoryModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    if (json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if (json["numberOfPages"] is int) {
      numberOfPages = json["numberOfPages"];
    }
    if (json["limit"] is int) {
      limit = json["limit"];
    }
  }

  static List<Metadata> fromList(List<Map<String, dynamic>> list) {
    return list.map(Metadata.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}

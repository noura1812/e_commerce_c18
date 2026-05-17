import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  int? sold;
  List<String>? images;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  int? ratingsAverage;
  ProductEntity({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.ratingsAverage,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

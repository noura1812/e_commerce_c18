import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  String? name;
  String? image;
  String? id;

  CategoryEntity({this.name, this.image, this.id});

  @override
  List<Object?> get props => [id];
}

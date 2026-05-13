part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class GetProductsLoadingState extends ProductsState {}

class GetProductsSuccessState extends ProductsState {
  final List<ProductEntity> products;

  const GetProductsSuccessState({required this.products});
}

class GetProductsFailureState extends ProductsState {
  final ErrorModel errorModel;

  const GetProductsFailureState({required this.errorModel});
}

part of 'cart_cubit.dart';

class CartState extends Equatable {
  final bool isLoading;
  final CartEntity? cartEntity;
  final ErrorModel? errorModel;

  const CartState({this.isLoading = false, this.cartEntity, this.errorModel});

  @override
  List<Object?> get props => [isLoading, cartEntity, errorModel];

  CartState copyWith({
    bool? isLoading,
    bool? rebuild,
    CartEntity? cartEntity,
    ErrorModel? errorModel,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      cartEntity: cartEntity ?? this.cartEntity,
      errorModel: errorModel,
    );
  }
}

part of 'wishlist_cubit.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

final class GetWishlistLoading extends WishlistState {}

final class GetWishlistSuccess extends WishlistState {
  final List<ProductEntity> products;

  const GetWishlistSuccess({required this.products});
  @override
  // TODO: implement props
  List<Object> get props => [products];
}

final class GetWishlistFailure extends WishlistState {
  final ErrorModel errorModel;

  const GetWishlistFailure({required this.errorModel});
}

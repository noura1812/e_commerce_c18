import 'package:bloc/bloc.dart';
import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/core/reusables/custom_dialogs.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/domain/usecases/edit_wishlist_usecase.dart';
import 'package:e_commerce_c18/features/products/domain/usecases/get_wishlist_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'wishlist_state.dart';

@singleton
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this._getWishlistProductsUsecase, this._editWishlistUsecase)
    : super(WishlistInitial());
  final GetWishlistProductsUsecase _getWishlistProductsUsecase;
  final EditWishlistUsecase _editWishlistUsecase;

  getWishlist() async {
    emit(GetWishlistLoading());
    CustomResponse<List<ProductEntity>> response = await _getWishlistProductsUsecase();
    switch (response) {
      case Success<List<ProductEntity>>():
        emit(GetWishlistSuccess(products: response.data));
      case Failure<List<ProductEntity>>():
        emit(GetWishlistFailure(errorModel: response.error));
    }
  }

  updateWishList(ProductEntity product, bool isFav) async {
    CustomResponse response = await _editWishlistUsecase(product.id!, isFav);
    switch (response) {
      case Success():
        if (state is GetWishlistSuccess) {
          List<ProductEntity> products = [...(state as GetWishlistSuccess).products];

          if (isFav) {
            products.add(product);
          } else {
            products.remove(product);
          }
          emit(GetWishlistSuccess(products: products));
        }

      case Failure():
        FailureDialog().show(title: response.error.toString());
    }
  }

  bool isInWishList(ProductEntity product) {
    if (state is GetWishlistSuccess) {
      for (var prod in (state as GetWishlistSuccess).products) {
        if (prod == product) {
          return true;
        }
      }
    }

    return false;
  }
}

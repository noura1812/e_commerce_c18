import 'package:bloc/bloc.dart';
import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/core/reusables/custom_dialogs.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/product_cart_entity.dart';
import 'package:e_commerce_c18/features/cart/domain/usecase/add_to_cart_usecase.dart';
import 'package:e_commerce_c18/features/cart/domain/usecase/get_cart_usecase.dart';
import 'package:e_commerce_c18/features/cart/domain/usecase/remove_from_cart_usecase.dart';
import 'package:e_commerce_c18/features/cart/domain/usecase/update_product_in_cart_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._getCartUsecase,
    this._addToCartUsecase,
    this._removeFromCartUsecase,
    this._updateProductInCartUsecase,
  ) : super(CartState());
  final GetCartUsecase _getCartUsecase;
  final AddToCartUsecase _addToCartUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;
  final UpdateProductInCartUsecase _updateProductInCartUsecase;

  getCart() async {
    emit(state.copyWith(isLoading: true));
    CustomResponse<CartEntity> response = await _getCartUsecase();

    switch (response) {
      case Success<CartEntity>():
        emit(state.copyWith(isLoading: false, cartEntity: response.data));
      case Failure<CartEntity>():
        emit(state.copyWith(isLoading: false, errorModel: response.error));
    }
  }

  addToCart(String productID, {bool showLoading = false}) async {
    if (showLoading) {
      LoadingDialog().show();
    }
    emit(state.copyWith(isLoading: true));
    CustomResponse<void> response = await _addToCartUsecase(productID);
    switch (response) {
      case Success<void>():
        emit(state.copyWith(isLoading: false));
        getCart();
      case Failure<void>():
        emit(state.copyWith(isLoading: false, errorModel: response.error));
    }
    if (showLoading) {
      LoadingDialog().remove();
    }
  }

  removeFromCart(String productID, {bool showLoading = false}) async {
    if (showLoading) {
      LoadingDialog().show();
    }
    emit(state.copyWith(isLoading: true));
    CustomResponse<void> response = await _removeFromCartUsecase(productID);

    print('-->$response');
    switch (response) {
      case Success<void>():
        emit(state.copyWith(isLoading: false));
        await getCart();
      case Failure<void>():
        emit(state.copyWith(isLoading: false, errorModel: response.error));
    }

    if (showLoading) {
      LoadingDialog().remove();
    }
  }

  updateCart(String productID, int count, {bool showLoading = false}) async {
    if (showLoading) {
      LoadingDialog().show();
    }
    emit(state.copyWith(isLoading: true));
    CustomResponse<void> response = await _updateProductInCartUsecase(productID, count);
    switch (response) {
      case Success<void>():
        emit(state.copyWith(isLoading: false));
        getCart();
      case Failure<void>():
        emit(state.copyWith(isLoading: false, errorModel: response.error));
    }
    if (showLoading) {
      LoadingDialog().remove();
    }
  }

  bool isInCart(String id) {
    if (state.cartEntity?.products != null) {
      int index = state.cartEntity!.products.indexWhere((element) => element.product?.id == id);
      return index != -1;
    }
    return false;
  }
}

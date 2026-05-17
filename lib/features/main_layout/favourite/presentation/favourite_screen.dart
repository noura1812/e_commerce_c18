import 'dart:developer';

import 'package:e_commerce_c18/core/resources/constants_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:e_commerce_c18/features/products/presentation/cubit/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        log('----->$state');
        switch (state) {
          case WishlistInitial():
          case GetWishlistLoading():
            return Center(child: CircularProgressIndicator());

          case GetWishlistFailure():
            return Center(child: Text(state.errorModel.toString()));

          case GetWishlistSuccess():
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return FavoriteItem(
                    product: state.products[index],
                    key: ValueKey(state.products[index].id),
                  );
                },
              ),
            );
        }
      },
    );
  }
}

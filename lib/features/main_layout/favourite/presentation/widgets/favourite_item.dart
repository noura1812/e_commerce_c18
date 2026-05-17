import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/constants_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/core/routes_manager/routes.dart';
import 'package:e_commerce_c18/core/widget/heart_button.dart';
import 'package:e_commerce_c18/features/main_layout/favourite/presentation/widgets/add_to_cart_button.dart';
import 'package:e_commerce_c18/features/main_layout/favourite/presentation/widgets/favourite_item_details.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/presentation/cubit/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.productDetails, arguments: product);
        },
        child: Container(
          height: AppSize.s135.h,
          padding: EdgeInsets.only(right: AppSize.s8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16.r),
            border: Border.all(color: ColorManager.primary.withOpacity(.3)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s16.r),
                  border: Border.all(color: ColorManager.primary.withOpacity(.6)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s16.r),
                  child: CachedNetworkImage(
                    width: AppSize.s120.w,
                    height: AppSize.s135.h,
                    fit: BoxFit.cover,
                    imageUrl: product.imageCover ?? '',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator(color: ColorManager.primary)),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: ColorManager.primary),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.s8.w),
                  child: FavouriteItemDetails(product: product),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  HeartButton(
                    isFav: context.read<WishlistCubit>().isInWishList(product),
                    product: product,
                  ),
                  SizedBox(height: AppSize.s14.h),
                  AddToCartButton(
                    onPressed: () {
                      //TODO:add product to cart
                    },
                    text: AppConstants.addToCart,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

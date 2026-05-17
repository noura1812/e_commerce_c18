import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_c18/core/widget/heart_button.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/presentation/cubit/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({super.key, required this.imageUrl, this.onTap, required this.product});
  final String imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, image) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        height: 300.h,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.topRight,
        child: HeartButton(
          isFav: context.read<WishlistCubit>().isInWishList(product),
          product: product,
        ),
      ),
    );
  }
}

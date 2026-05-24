import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/presentation/favourite/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartButton extends StatefulWidget {
  final bool isFav;
  final ProductEntity product;
  const HeartButton({super.key, required this.isFav, required this.product});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  late bool isClicked = widget.isFav;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // radius: 25,
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        setState(() {
          isClicked = !isClicked;
          context.read<WishlistCubit>().updateWishList(widget.product, isClicked);
        });
      },
      child: Material(
        // borderRadius: BorderRadius.circular(2),
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ImageIcon(
            AssetImage(isClicked ? IconsAssets.icClickedHeart : IconsAssets.icHeart),
            color: ColorManager.primary,
          ),
        ),
      ),
    );
  }
}

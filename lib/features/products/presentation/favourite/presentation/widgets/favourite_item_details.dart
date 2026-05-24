import 'package:colornames/colornames.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/features/products/presentation/favourite/presentation/widgets/custom_txt_widget.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteItemDetails extends StatelessWidget {
  const FavouriteItemDetails({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: product.title ?? '',
          textStyle: getSemiBoldStyle(color: ColorManager.primaryDark, fontSize: AppSize.s18.sp),
        ),

        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${product.price}  ',
              textStyle: getSemiBoldStyle(
                color: ColorManager.primaryDark,
                fontSize: AppSize.s18.sp,
              ).copyWith(letterSpacing: 0.17),
            ),
          ],
        ),
      ],
    );
  }
}

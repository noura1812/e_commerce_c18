import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/core/routes_manager/routes.dart';
import 'package:e_commerce_c18/core/widget/product_counter.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/product_cart_entity.dart';
import 'package:e_commerce_c18/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce_c18/features/cart/presentation/widgets/color_and_size_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.size, required this.productCartEntity});

  final int size;
  final ProductCartEntity productCartEntity;
  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productDetails),
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            // display image in the container
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
              ),
              child: Image.network(
                productCartEntity.product!.imageCover!,
                fit: BoxFit.cover,
                height: isPortrait ? height * 0.142 : height * 0.23,
                width: isPortrait ? width * 0.29 : 165.w,
              ),
            ),
            // SizedBox(width: 8.w),
            // display details product=========================
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p8.w,
                  vertical: AppPadding.p8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // title and delete button ==
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            productCartEntity.product!.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<CartCubit>().removeFromCart(
                              productCartEntity.product!.id!,
                              showLoading: true,
                            );
                          },
                          child: Image.asset(
                            IconsAssets.icDelete,
                            color: ColorManager.textColor,
                            height: 22.h,
                          ),
                        ),
                      ],
                    ),

                    // SizedBox(height: 7.h),
                    const Spacer(),
                    // display color and size===================
                    const Spacer(),
                    // display price and quantity =================
                    Row(
                      children: [
                        if (productCartEntity.price != null)
                          Expanded(
                            child: Text(
                              'EGP ${productCartEntity.price}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: getBoldStyle(
                                color: ColorManager.textColor,
                                fontSize: AppSize.s18.sp,
                              ),
                            ),
                          ),
                        ProductCounter(
                          productCounter: productCartEntity.count ?? 1,
                          productID: productCartEntity.product!.id!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatelessWidget {
  final int productCounter;
  final String productID;
  ProductCounter({super.key, required this.productCounter, required this.productID});

  late int count = productCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (count >= 2) {
                count = count - 1;

                context.read<CartCubit>().updateCart(productID, count, showLoading: true);
              }
            },
            child: Icon(Icons.remove_circle_outline, size: 20.w, color: ColorManager.white),
          ),
          SizedBox(width: 18.w),
          Text(
            '${count}',
            style: getMediumStyle(color: ColorManager.white).copyWith(fontSize: 18.sp),
          ),
          SizedBox(width: 18.w),
          InkWell(
            onTap: () {
              count = count + 1;

              context.read<CartCubit>().updateCart(productID, count, showLoading: true);
            },
            child: Icon(Icons.add_circle_outline, color: ColorManager.white, size: 20.w),
          ),
        ],
      ),
    );
  }
}

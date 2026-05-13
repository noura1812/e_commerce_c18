// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/features/categories/domain/entities/category_entity.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget({Key? key, required this.categoryEntity}) : super(key: key);
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CachedNetworkImage(
        //   height: 100,
        //   width: 100,
        //   fit: BoxFit.cover,
        //   imageUrl: ImageAssets.categoryHomeImage,
        //   placeholder: (context, url) =>
        //       const Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) =>
        //       const Center(child: Icon(Icons.error)),
        //   imageBuilder: (context, imageProvider) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         image: DecorationImage(
        //           image: imageProvider,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     );
        //   },
        // ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.network(categoryEntity.image!, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          categoryEntity.name ?? '',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}

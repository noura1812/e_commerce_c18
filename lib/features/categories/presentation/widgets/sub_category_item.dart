import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/core/routes_manager/routes.dart';
import 'package:e_commerce_c18/features/categories/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const SubCategoryItem(this.categoryEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, Routes.productsScreenRoute, arguments: categoryEntity.id),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
                border: Border.all(color: ColorManager.primary, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.asset(ImageAssets.subcategoryCardImage, fit: BoxFit.cover),
              ),
            ),
          ),
          Text(
            categoryEntity.name ?? '',
            style: getRegularStyle(color: ColorManager.primary),
            // maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

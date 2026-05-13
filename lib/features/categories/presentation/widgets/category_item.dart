import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/font_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/features/categories/domain/entities/category_entity.dart';
import 'package:e_commerce_c18/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryItem(this.categoryEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    // Handle item click by calling onItemClick callback
    CategoryEntity? selectedCat = context.watch<CategoriesCubit>().state.selectedCategory;
    bool isSelected = categoryEntity == selectedCat;
    return InkWell(
      onTap: () => context.read<CategoriesCubit>().selectCat(categoryEntity),
      child: Container(
        // Set background color based on selection
        color: isSelected ? ColorManager.white : Colors.transparent,
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Row(
          children: [
            //Show/hide the indicator based on selection
            Visibility(
              visible: isSelected,
              child: Container(
                width: AppSize.s8,
                height: AppSize.s60,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(AppSize.s100),
                ),
              ),
            ),
            // wrap the text with expanded to avoid overflow error
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p16,
                  horizontal: AppPadding.p8,
                ),
                child: Text(
                  categoryEntity.name ?? '',
                  textAlign: TextAlign.start,
                  style: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

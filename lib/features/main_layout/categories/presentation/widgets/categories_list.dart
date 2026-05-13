import 'package:e_commerce_c18/core/di/di.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:e_commerce_c18/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.containerGray,
          border: Border(
            // set the border for only 3 sides
            top: BorderSide(width: AppSize.s2, color: ColorManager.primary.withOpacity(0.3)),
            left: BorderSide(width: AppSize.s2, color: ColorManager.primary.withOpacity(0.3)),
            bottom: BorderSide(width: AppSize.s2, color: ColorManager.primary.withOpacity(0.3)),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
        ),

        // the categories items list
        child: ClipRRect(
          // clip the corners of the container that hold the list view
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.categories?.length ?? 0,
                itemBuilder: (context, index) => CategoryItem(state.categories![index]),
              );
            },
          ),
        ),
      ),
    );
  }

  // callback function to change the selected index
  onItemClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

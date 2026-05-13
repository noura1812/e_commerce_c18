import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/font_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:e_commerce_c18/features/categories/presentation/widgets/category_card_item.dart';
import 'package:e_commerce_c18/features/categories/presentation/widgets/sub_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              'Laptops & Electronics',
              style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s14),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: CategoryCardItem(
              "Laptops & Electronics",
              ImageAssets.categoryCardImage,
              goToCategoryProductsListScreen,
            ),
          ),
          // the grid view of the subcategories
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state.subCategoriesFailure != null) {
                return SliverToBoxAdapter(
                  child: Center(child: Text("${state.subCategoriesFailure.toString()}")),
                );
              } else if (state.subLoading) {
                return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
              }
              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.subCategories?.length ?? 0,
                  (context, index) => SubCategoryItem(state.subCategories![index]),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: AppSize.s8,
                  crossAxisSpacing: AppSize.s8,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}

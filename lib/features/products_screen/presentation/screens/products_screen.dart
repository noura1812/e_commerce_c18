import 'package:e_commerce_c18/core/di/di.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/features/products/presentation/cubit/products_cubit.dart';
import 'package:e_commerce_c18/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<ProductsCubit>()..getProductsBySubCat(id),
      child: Scaffold(
        appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            switch (state) {
              case ProductsInitial():
              case GetProductsLoadingState():
                return Center(child: CircularProgressIndicator());

              case GetProductsFailureState():
                return Center(child: Text(state.errorModel.toString()));

              case GetProductsSuccessState():
                return Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                          itemBuilder: (context, index) {
                            return CustomProductWidget(
                              product: state.products[index],
                              height: height,
                              width: width,
                            );
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

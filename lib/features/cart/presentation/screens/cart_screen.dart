import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/features/cart/domain/entity/product_cart_entity.dart';
import 'package:e_commerce_c18/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce_c18/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:e_commerce_c18/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: getMediumStyle(fontSize: 20, color: ColorManager.textColor)),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartEntity != null) {
            List<ProductCartEntity> products = state.cartEntity!.products ?? [];
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: Column(
                children: [
                  Expanded(
                    // the list of cart items ===============
                    child: ListView.separated(
                      itemBuilder: (context, index) => CartItemWidget(
                        productCartEntity: products[index],
                        size: 40,
                        key: ValueKey(products[index].id),
                      ),
                      separatorBuilder: (context, index) => SizedBox(height: AppSize.s12.h),
                      itemCount: products.length,
                    ),
                  ),
                  // the total price and checkout button========
                  if (state.cartEntity?.totalCartPrice != null)
                    TotalPriceAndCheckoutBotton(
                      totalPrice: state.cartEntity!.totalCartPrice!,
                      checkoutButtonOnTap: () {},
                    ),
                  SizedBox(height: 10.h),
                ],
              ),
            );
          }

          if (state.isLoading) return Center(child: CircularProgressIndicator());
          if (state.errorModel != null) {
            return Center(
              child: Column(
                children: [
                  Text(state.errorModel.toString()),
                  ElevatedButton.icon(
                    onPressed: () => context.read<CartCubit>().getCart(),
                    label: Text("refresh"),
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

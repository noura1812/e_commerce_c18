import 'package:e_commerce_c18/core/routes_manager/routes.dart';
import 'package:e_commerce_c18/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_commerce_c18/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:e_commerce_c18/features/cart/screens/cart_screen.dart';
import 'package:e_commerce_c18/features/main_layout/main_layout.dart';
import 'package:e_commerce_c18/features/product_details/presentation/screen/product_details.dart';
import 'package:e_commerce_c18/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());

      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetails());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}

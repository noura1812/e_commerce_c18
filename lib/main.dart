import 'package:e_commerce_c18/core/bloc_obs/bloc_obs.dart';
import 'package:e_commerce_c18/core/di/di.dart';
import 'package:e_commerce_c18/core/routes_manager/routes.dart';
import 'package:e_commerce_c18/features/products/presentation/cubit/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => getIt<WishlistCubit>()..getWishlist(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          navigatorKey: navigatorKey,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
        ),
      ),
    );
  }
}

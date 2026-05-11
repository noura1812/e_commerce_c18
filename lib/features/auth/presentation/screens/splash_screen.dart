import 'package:e_commerce_c18/core/di/di.dart';
import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/constants_manager.dart';
import 'package:e_commerce_c18/core/routes_manager/routes.dart';
import 'package:e_commerce_c18/core/services/secured_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  bool isLogged = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        animate = true;
      });
      _checkLogin();
    });
  }

  _checkLogin() async {
    bool response =
        await getIt<SecuredStorageService>().getString(key: AppConstants.tokenKey) != null;

    setState(() {
      isLogged = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedContainer(
          width: animate ? 300 : 0,
          duration: Duration(seconds: 2),
          curve: Curves.easeInSine,
          onEnd: () async {
            if (context.mounted) {
              if (isLogged) {
                Navigator.of(context).pushNamed(Routes.mainRoute);
              } else {
                Navigator.of(context).pushNamed(Routes.signInRoute);
              }
            }
          },
          child: Center(child: SvgPicture.asset('assets/svg_images/splash_logo.svg')),
        ),
      ),
    );
  }
}

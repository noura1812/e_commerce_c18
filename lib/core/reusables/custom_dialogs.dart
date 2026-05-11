import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/styles_manager.dart';
import 'package:e_commerce_c18/core/routes_manager/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

sealed class CustomDialogs {
  void show({String? title});
}

class LoadingDialog extends CustomDialogs {
  @override
  void show({String? title}) {
    if (navigatorKey.currentContext == null) return;
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
  }
}

class SuccessDialog extends CustomDialogs {
  @override
  void show({String? title}) {
    if (navigatorKey.currentContext == null) return;
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog.adaptive(
        title: LottieBuilder.asset(LottyAssets.success),
        content: Text(title ?? ''),
      ),
    );
  }
}

class FailureDialog extends CustomDialogs {
  @override
  void show({String? title}) {
    if (navigatorKey.currentContext == null) return;
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog.adaptive(
        title: LottieBuilder.asset(LottyAssets.error, height: 60.h, fit: BoxFit.contain),
        content: Text(title ?? '', style: getMediumStyle(color: ColorManager.black, fontSize: 16)),
      ),
    );
  }
}

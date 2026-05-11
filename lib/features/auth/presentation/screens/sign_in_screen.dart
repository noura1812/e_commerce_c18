import 'package:e_commerce_c18/core/di/di.dart';
import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/core/reusables/custom_dialogs.dart';
import 'package:e_commerce_c18/core/routes_manager/routes.dart';
import 'package:e_commerce_c18/core/widget/custom_elevated_button.dart';
import 'package:e_commerce_c18/core/widget/main_text_field.dart';
import 'package:e_commerce_c18/core/widget/validators.dart';
import 'package:e_commerce_c18/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Form(
        key: _globalKey,
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            print('---->$state');
            if (state is LoginLoadingState) {
              LoadingDialog().show();
            } else if (state is LoginSuccessState) {
              // Navigator.of(context).pop();
              //
              SuccessDialog().show(title: "Success");
            } else if (state is LoginFailureState) {
              Navigator.of(context).pop();
              //

              FailureDialog().show(title: state.failure.error.toString());
            }
          },
          child: Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSize.s40.h),
                      Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                      SizedBox(height: AppSize.s40.h),
                      Text(
                        'Welcome Back To Route',
                        style: getBoldStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s24.sp),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: getLightStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(height: AppSize.s50.h),
                      BuildTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your name',
                        label: 'User name',
                        textInputType: TextInputType.emailAddress,
                        validation: AppValidators.validateEmail,
                        controller: emailController,
                      ),
                      SizedBox(height: AppSize.s28.h),
                      BuildTextField(
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'Password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                        controller: passwordController,
                      ),
                      SizedBox(height: AppSize.s8.h),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget password?',
                              style: getMediumStyle(
                                color: ColorManager.white,
                              ).copyWith(fontSize: FontSize.s18.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s60.h),
                      Builder(
                        builder: (ctx) {
                          return Center(
                            child: SizedBox(
                              // width: MediaQuery.of(context).size.width * .8,
                              child: CustomElevatedButton(
                                // borderRadius: AppSize.s8,
                                isStadiumBorder: false,
                                label: 'Login',
                                backgroundColor: ColorManager.white,
                                textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s18,
                                ),
                                onTap: () {
                                  if (_globalKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(
                                      ctx,
                                      listen: false,
                                    ).login(emailController.text, passwordController.text);
                                  }

                                  // Navigator.pushNamedAndRemoveUntil(
                                  //   context,
                                  //   Routes.mainRoute,
                                  //   (route) => false,
                                  // );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: getSemiBoldStyle(
                              color: ColorManager.white,
                            ).copyWith(fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(width: AppSize.s8.w),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.signUpRoute),
                            child: Text(
                              'Create Account',
                              style: getSemiBoldStyle(
                                color: ColorManager.white,
                              ).copyWith(fontSize: FontSize.s16.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

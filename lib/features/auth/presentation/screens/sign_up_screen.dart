import 'package:e_commerce_c18/core/di/di.dart';
import 'package:e_commerce_c18/core/resources/assets_manager.dart';
import 'package:e_commerce_c18/core/resources/color_manager.dart';
import 'package:e_commerce_c18/core/resources/values_manager.dart';
import 'package:e_commerce_c18/core/reusables/custom_dialogs.dart';
import 'package:e_commerce_c18/core/widget/custom_elevated_button.dart';
import 'package:e_commerce_c18/core/widget/main_text_field.dart';
import 'package:e_commerce_c18/core/widget/validators.dart';
import 'package:e_commerce_c18/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_c18/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/styles_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          print('--->$state');
          if (state is SignupLoadingState) {
            LoadingDialog().show();
          } else if (state is SignupSuccessState) {
            Navigator.of(context).pop();
            SuccessDialog().show();
          }
          if (state is SignupFailureState) {
            Navigator.of(context).pop();
            FailureDialog().show(title: state.failure.error.toString());
          }
        },
        child: Form(
          key: _formKey,
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
                      BuildTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your full name',
                        label: 'Full Name',
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                        controller: name,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your mobile no.',
                        backgroundColor: ColorManager.white,
                        label: 'Mobile Number',
                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                        controller: phoneNumber,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your email address',
                        backgroundColor: ColorManager.white,
                        label: 'E-mail address',
                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,

                        controller: email,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                        controller: password,
                      ),
                      SizedBox(height: AppSize.s50.h),
                      Builder(
                        builder: (ctx) {
                          return Center(
                            child: SizedBox(
                              height: AppSize.s60.h,
                              width: MediaQuery.of(context).size.width * .9,
                              child: CustomElevatedButton(
                                // borderRadius: AppSize.s8,
                                label: 'Sign Up',
                                backgroundColor: ColorManager.white,
                                textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s20,
                                ),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    UserEntity user = UserEntity(
                                      email: email.text,
                                      name: name.text,
                                      password: password.text,
                                      phoneNumber: phoneNumber.text,
                                    );
                                    ctx.read<AuthCubit>().signup(user);
                                  }
                                },
                              ),
                            ),
                          );
                        },
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

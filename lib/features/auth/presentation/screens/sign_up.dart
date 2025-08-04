import 'package:e_commerce_app/core/resources/colors_manager.dart';
import 'package:e_commerce_app/core/resources/dialog_utils.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widgets/main_text_field.dart';
import 'package:e_commerce_app/core/widgets/validators.dart';
import 'package:e_commerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:e_commerce_app/features/auth/presentation/auth_cubit_state/auth_cubit_state.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';

import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _nameController;

  late final TextEditingController _phoneController;

  late final TextEditingController _emailController;

  late final TextEditingController _passwordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.s40.h),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(height: AppSize.s40.h),
                  BuildTextField(
                    controller: _nameController,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your full name',
                    label: 'Full Name',
                    textInputType: TextInputType.name,
                    validation: AppValidators.validateFullName,
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: _phoneController,
                    hint: 'enter your mobile no.',
                    backgroundColor: ColorManager.white,
                    label: 'Mobile Number',
                    validation: AppValidators.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: _emailController,
                    hint: 'enter your email address',
                    backgroundColor: ColorManager.white,
                    label: 'E-mail address',
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: _passwordController,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: AppSize.s50.h),
                  Center(
                    child: SizedBox(
                      height: AppSize.s60.h,
                      width: MediaQuery.of(context).size.width * .9,
                      child: BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is RegisterLoadingState) {
                            DialogUtils.showLoading(context: context);
                          } else if (state is RegisterErrorState) {
                            DialogUtils.hideDialog(context);
                            DialogUtils.showMessageDialog(
                              context,
                              message: state.errorMsg,
                              posActionTitle: "ok",
                              posAction: () {
                                Navigator.pop(context);
                              },
                            );
                          } else if (state is RegisterSuccessState) {
                            DialogUtils.hideDialog(context);
                            DialogUtils.showMessageDialog(
                              context,
                              posActionTitle: "ok",
                              posAction: () {
                                Navigator.pushReplacementNamed(context, Routes.signInRoute);
                              },
                              message: "Register Successfully",
                            );
                          }
                        },
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: AppSize.s20,
                          ),
                          onTap: () {
                            if (!formKey.currentState!.validate()) return;
                            BlocProvider.of<AuthCubit>(context).register(
                              RegisterRequest(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                rePassword: _passwordController.text,
                                phone: _phoneController.text,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(width: AppSize.s8.w),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signInRoute),
                        child: Text(
                          'login',
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
    );
  }
}

import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/colors_manager.dart';
import 'package:e_commerce_app/core/resources/dialog_utils.dart';
import 'package:e_commerce_app/core/resources/values_manager.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widgets/main_text_field.dart';
import 'package:e_commerce_app/core/widgets/validators.dart';
import 'package:e_commerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:e_commerce_app/features/auth/presentation/auth_cubit_state/auth_cubit_state.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/auth_cubit.dart';
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
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                    controller: _emailController,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your name',
                    label: 'User name',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                  ),
                  SizedBox(height: AppSize.s28.h),
                  BuildTextField(
                    controller: _passwordController,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
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
                  Center(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * .8,
                      child: BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is LoginLoadingState) {
                            DialogUtils.showLoading(context: context);
                          } else if (state is LoginErrorState) {
                            DialogUtils.hideDialog(context);
                            DialogUtils.showMessageDialog(
                              context,
                              message: state.errorMsg,
                              posActionTitle: "ok",
                              posAction: () {
                                Navigator.pop(context);
                              },
                            );
                          } else if (state is LoginSuccessState) {
                            // Navigator.pushNamed(context, Routes.mainRoute);
                            DialogUtils.hideDialog(context);
                            DialogUtils.showMessageDialog(
                              context,
                              posActionTitle: "ok",
                              posAction: () {
                                Navigator.pushReplacementNamed(context, Routes.mainLayout);
                              },
                              message: "Login Successfully",
                            );
                          }
                        },
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
                            if (!formKey.currentState!.validate()) return;
                            BlocProvider.of<AuthCubit>(context).login(
                              LoginRequest(
                                email: _emailController.text,
                                password: _passwordController.text,
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
                        'Don’t have an account?',
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(width: AppSize.s8.w),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signUpRoute),
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
    );
  }
}

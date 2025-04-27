import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/theme/app_images.dart';
import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/widgets/custom_text_form_field.dart';
import 'package:dogs_and_cats/presentation/auth/blocs/login_bloc/login_bloc.dart';
import 'package:dogs_and_cats/presentation/auth/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/validation_rules.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.isUser});
  final bool isUser;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void clearText() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.map(
                      initial: (_) {},
                      loading: (_) {},
                      success: (state) {
                        clearText();
                        CustomSnackBar.showSuccess(
                            context, AppString.accountCreated);
                        if (widget.isUser) {
                          context.goNamed(RoutesNames.services);
                        } else {
                          context.goNamed(RoutesNames.contact);
                        }
                      },
                      failure: (state) {
                        CustomSnackBar.showError(context, state.message);
                      });
                },
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(alignment: Alignment.topLeft, child: appLogo),
                      SizedBox(
                        height: 35,
                      ),
                      CustomTextFormField(
                        controller: _firstNameController,
                        color: AppColors.whiteColor,
                        colorText: textTheme.bodyMedium!
                            .copyWith(color: AppColors.whiteColor),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.required;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        hintText: AppString.firstName,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextFormField(
                        controller: _lastNameController,
                        color: AppColors.whiteColor,
                        colorText: textTheme.bodyMedium!
                            .copyWith(color: AppColors.whiteColor),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.required;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        hintText: AppString.lastName,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        color: AppColors.whiteColor,
                        colorText: textTheme.bodyMedium!
                            .copyWith(color: AppColors.whiteColor),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.required;
                          } else if (!ValidationRules.emailValidation
                              .hasMatch(value)) {
                            return AppString.providedValidEmail;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        hintText: AppString.email,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextFormField(
                        controller: _passwordController,
                        color: AppColors.whiteColor,
                        colorText: textTheme.bodyMedium!
                            .copyWith(color: AppColors.whiteColor),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.required;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isPasswordVisible,
                        hintText: AppString.password,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          child: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      RoundedElevatedButton(
                        onPressed: () {
                          if (_registerFormKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                                  LoginEvent.signUp(
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text),
                                );
                          }
                        },
                        widget: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return state.maybeMap(loading: (_) {
                              return CircularProgressIndicator(
                                color: Colors.white,
                              );
                            }, orElse: () {
                              return Text(
                                AppString.register,
                                style: const TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              );
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goNamed(RoutesNames.login, pathParameters: {
                            'isUser': widget.isUser.toString()
                          });
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "У Вас уже есть аккаунт? ",
                            children: [
                              TextSpan(
                                text: 'Войти',
                              ),
                            ],
                          ),
                        ),
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

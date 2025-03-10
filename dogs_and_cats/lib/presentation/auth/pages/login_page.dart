import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/widgets/custom_text_form_field.dart';
import 'package:dogs_and_cats/presentation/auth/bloc/auth_bloc.dart';
import 'package:dogs_and_cats/presentation/auth/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/utils/validation_rules.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void clearText() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.map(
                  initial: (_) {},
                  loading: (_) {},
                  success: (_) {
                    clearText();
                    CustomSnackBar.showSuccess(context, AppString.loginSuccess);
                    context.goNamed(RoutesNames.search);
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
                  CustomTextFormField(
                    controller: _emailController,
                    color: AppColors.whiteColor,
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
                    height: 10,
                  ),
                  RoundedElevatedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthEvent.signIn(
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                      }
                    },
                    widget: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state.maybeMap(loading: (_) {
                          return CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }, orElse: () {
                          return Text(
                            AppString.login,
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
                      context.goNamed(RoutesNames.register);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "У Вас нет аккаунта? ",
                        children: [
                          TextSpan(
                            text: 'Зарегистрироваться',
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
    );
  }
}

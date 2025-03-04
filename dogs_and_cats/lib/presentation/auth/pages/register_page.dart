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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

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
                    CustomSnackBar.showSuccess(
                        context, AppString.accountCreated);
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
                    controller: _firstNameController,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppString.required;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isPasswordVisible,
                    hintText: AppString.password,
                    suffix: InkWell(
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
                    buttonText: AppString.register,
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthEvent.signUp(
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.goNamed(RoutesNames.login);
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
    );
  }
}

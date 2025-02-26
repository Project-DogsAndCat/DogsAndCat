import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/auth/bloc/auth_bloc.dart';
import '../theme/app_colors.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton(
      {super.key,
        required this.buttonText,
        this.onPressed,
        this.color = AppColors.appColor});
  final String buttonText;
  final Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        elevation: const WidgetStatePropertyAll(0),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            MediaQuery.sizeOf(context).width,
            45,
          ),
        ),
      ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.maybeMap(
              loading: (_) {
                return CircularProgressIndicator(
                  color: Colors.white,
                );
              },
              orElse: () {
                return Text(
                  buttonText,
                  style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                );
              }
          );
        },
      ),
    );
  }
}

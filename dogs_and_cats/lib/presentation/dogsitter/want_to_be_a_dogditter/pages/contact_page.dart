import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/presentation/settings/bloc/become_dogsitter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/secrets/secrets.dart';
import '../../../../core/widgets/custom_snackbar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    super.key,
    this.color,
    this.isNeedBecome = false,
  });
  final Color? color;
  final bool isNeedBecome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: BlocListener<BecomeDogsitterCubit, BecomeDogsitterState>(
        listener: (context, state) {
          state.map(
              initial: (_) {},
              loading: (_) {},
              success: (_) {
                CustomSnackBar.showSuccess(
                    context, 'Теперь вы владеете правами догситтера');
              },
              failure: (state) {
                CustomSnackBar.showError(context, state.message);
              });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Свяжитесь с администратором',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.telegram,
                      size: 55,
                      color: AppColors.telegramColor,
                    ),
                    onTap: () {
                      _launchUrl();
                    },
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.phone,
                      size: 55,
                      color: AppColors.primaryColor,
                    ),
                    onTap: () {
                      _launchTel();
                    },
                  ),
                ],
              ),
              isNeedBecome
                  ? GestureDetector(
                      child: const Icon(
                        Icons.fast_forward,
                        size: 55,
                        color: AppColors.primaryColor,
                      ),
                      onTap: () {
                        context.read<BecomeDogsitterCubit>().becomeDogsitter();
                      },
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(AppSecrets.telegramUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Ошибка $_url');
    }
  }

  void _launchTel() async {
    final Uri phoneUrl = Uri(
      scheme: 'tel',
      path: AppSecrets.phone,
    );
    if (!await launchUrl(phoneUrl)) {
      throw Exception('Ошибка $phoneUrl');
    }
  }
}

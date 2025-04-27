import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/secrets/secrets.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Center(
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
          ],
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

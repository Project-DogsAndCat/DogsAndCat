import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/presentation/auth/widgets/tile_role.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';

class ChooseRole extends StatelessWidget {
  const ChooseRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TileRole(
            title: 'Я - клиент',
            subtitle: 'Хочу заказать выгул, передержку или зооняню',
            buttonText: 'Войти как клиент',
            onPressed: () {
              context.goNamed(RoutesNames.register,
                  pathParameters: {'isUser': true.toString()});
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          TileRole(
            title: 'Я - выгульщик или хочу им стать',
            subtitle: 'Нужно зарегистрироваться или войти',
            buttonText: 'Войти как выгульщик',
            onPressed: () {
              context.goNamed(RoutesNames.register,
                  pathParameters: {'isUser': false.toString()});
            },
          )
        ],
      ),
    );
  }
}

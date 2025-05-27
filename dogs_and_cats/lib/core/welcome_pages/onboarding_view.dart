import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/welcome_pages/animated_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/theme.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final List<Color> _featuresColors = [
    CupertinoColors.systemBlue,
    CupertinoColors.systemGreen,
    CupertinoColors.systemOrange,
    CupertinoColors.systemPurple,
    CupertinoColors.systemTeal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoOnboarding(
        backgroundColor: AppColors.backGroundColor,
        bottomButtonChild: Text('Далее'),
        bottomButtonColor: AppColors.primaryColor,
        onPressedOnLastPage: () {
          context.goNamed(RoutesNames.choseRole);
        },
        pages: [
          _buildWelcomePage(),
          _buildPetSelectionPage(),
          _buildPricingPage(),
        ],
      ),
    );
  }

  // First Page
  _buildWelcomePage() {
    return WhatsNewPage(
      titleFlex: 3,
      title: AnimatedWrapper(
        index: 1,
        child: Text(
          'Добро пожаловать в Dogs&Cats',
          style: textTheme.titleLarge!
              .copyWith(color: AppColors.whiteColor, fontSize: 40),
        ),
      ),
      features: [
        AnimatedWrapper(
          index: 2,
          child: WhatsNewFeature(
            title: Text(
              'Сделайте свой первый заказ',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте заявку, чтобы с вашим питомцам погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.capslock, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text(
              'Выберите услугу',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Можем погулять или временно приютить Вашего питомца',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.arrow_branch, 1),
          ),
        ),
        AnimatedWrapper(
          index: 4,
          child: WhatsNewFeature(
            title: Text(
              'За Вашими питомцами позаботятся',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Найдем индивидуальный подход с Вашими питомцами',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.shield_fill, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text(
              'Ваш заказ примут очень быстро',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Наша компания имеет огромный штаб догситтеров, поэтому Ваш питомец не останется без внимания',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.group, 3),
          ),
        ),
      ],
    );
  }

  // Second page
  _buildPetSelectionPage() {
    return WhatsNewPage(
      titleFlex: 3,
      title: AnimatedWrapper(
        index: 1,
        child: Text(
          'Добро пожаловать в Dogs&Cats',
          style: textTheme.titleLarge!
              .copyWith(color: AppColors.whiteColor, fontSize: 40),
        ),
      ),
      features: [
        AnimatedWrapper(
          index: 2,
          child: WhatsNewFeature(
            title: Text(
              'Указывайте всех Ваших питомцев',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Добавляйте своих питомцев в Вашем профиле',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.add, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text(
              'Отслеживайте Ваши заказы',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Удобно можно остлеживать все Ваши, вновь добавленные, заказы',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.calendar, 1),
          ),
        ),
        AnimatedWrapper(
          index: 4,
          child: WhatsNewFeature(
            title: Text(
              'Быстрый ответ от нас',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'При принятии Вашего заказа догситтером приложение оповестит Вам об этом',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.bell_fill, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text(
              'Выберите удобное для Вас место встречи',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Указывайте адрес используя Ваше местоположение или просто найдите свой адрес',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.map, 3),
          ),
        ),
      ],
    );
  }

  // Third page
  _buildPricingPage() {
    return WhatsNewPage(
      titleFlex: 3,
      title: AnimatedWrapper(
        index: 1,
        child: Text(
          'Добро пожаловать в Dogs&Cats',
          style: textTheme.titleLarge!
              .copyWith(color: AppColors.whiteColor, fontSize: 40),
        ),
      ),
      features: [
        AnimatedWrapper(
          index: 2,
          child: WhatsNewFeature(
            title: Text(
              'Вступайте в наши ряды',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте заявку адмистратору, что Вы желаете стать догситтером',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.briefcase_fill, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text(
              'Наши сотрудники проходят проверку',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'С Вашими питомцами будут находиться проверенные люди',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.person_badge_plus, 1),
          ),
        ),
        AnimatedWrapper(
          index: 4,
          child: WhatsNewFeature(
            title: Text(
              'Оценивайте заказ',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'После выполнения заказа Вы можете поставить оценку за качество работы догситтера',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.star_lefthalf_fill, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text(
              'Связь с догситтером',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Можете связаться с догситтером по телефону или электронному адресу почты',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.phone_fill, 3),
          ),
        ),
      ],
    );
  }

  // Helper Function for get icon style
  Icon _coloredIcon(IconData icon, int index) {
    return Icon(
      icon,
      color: _featuresColors[index % _featuresColors.length],
      size: 28,
    );
  }
}

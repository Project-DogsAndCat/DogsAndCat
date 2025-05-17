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
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.car_detailed, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text(
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
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
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.phone_fill, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text(
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.shield_fill, 3),
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
          'Добро пожаловать в Петсерство',
          style: textTheme.titleLarge!
              .copyWith(color: AppColors.whiteColor, fontSize: 40),
        ),
      ),
      features: [
        AnimatedWrapper(
          index: 2,
          child: WhatsNewFeature(
            title: Text(
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.car_detailed, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text(
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
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
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.phone_fill, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text(
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.shield_fill, 3),
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
          'Добро пожаловать в Петсерство',
          style: textTheme.titleLarge!
              .copyWith(color: AppColors.whiteColor, fontSize: 40),
        ),
      ),
      features: [
        AnimatedWrapper(
          index: 2,
          child: WhatsNewFeature(
            title: Text(
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.car_detailed, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text(
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
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
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.phone_fill, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text(
              'Wide Range of Cars',
              style:
                  textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
            ),
            description: Column(
              children: [
                Text(
                  'Оставьте услугу, чтобы с вашим петсером погуляли',
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
            icon: _coloredIcon(CupertinoIcons.shield_fill, 3),
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

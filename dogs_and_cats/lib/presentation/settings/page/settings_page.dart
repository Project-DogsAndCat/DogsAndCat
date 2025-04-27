import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/cubit/theme_cubit.dart';
import '../../dogsitter/want_to_be_a_dogditter/pages/contact_page.dart';
import '../widgets/settings_list_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: true,
              floating: true,
              title: Text('Настройки'),
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: SettingsListCard(
                title: 'Темная тема',
                value: brightness,
                onChanged: (value) => _setThemeBrightness(context, value),
              ),
            ),
            SliverToBoxAdapter(
              child: const SizedBox(
                height: 10.0,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomProfileButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (newContext) {
                          return ContactPage();
                        });
                  },
                  mainInfoTitle: AppString.becomeDogsitter,
                  icon: Icons.keyboard_arrow_right),
            )
          ],
        ),
      ),
    );
  }

  void _setThemeBrightness(BuildContext context, bool value) {
    context
        .read<ThemeCubit>()
        .setThemeBrightness(value ? Brightness.dark : Brightness.light);
  }
}

import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:dogs_and_cats/presentation/settings/bloc/become_dogsitter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/cubit/theme_cubit.dart';
import '../../../core/theme/theme.dart';
import '../../auth/blocs/auth_bloc/auth_bloc.dart';
import '../../dogsitter/want_to_be_a_dogditter/pages/contact_page.dart';
import '../widgets/settings_list_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: true,
              floating: true,
              title: Text(
                AppString.settings,
                style: textTheme.titleMedium,
              ),
              elevation: 0,
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: SettingsListCard(
                title: AppString.darkTheme,
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
                          return BlocProvider(
                            create: (context) => getIt<BecomeDogsitterCubit>(),
                            child: ContactPage(
                              isNeedBecome: true,
                            ),
                          );
                        });
                  },
                  mainInfoTitle: AppString.becomeDogsitter,
                  icon: Icons.keyboard_arrow_right),
            ),
            SliverToBoxAdapter(
              child: const SizedBox(
                height: 20.0,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomProfileButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthEvent.userLogOut());
                    context.goNamed(RoutesNames.choseRole);
                  },
                  mainInfoTitle: AppString.logout,
                  icon: Icons.exit_to_app),
            ),
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

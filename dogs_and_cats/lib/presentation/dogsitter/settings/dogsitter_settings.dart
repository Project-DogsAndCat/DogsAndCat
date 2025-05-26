import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/cubit/theme_cubit.dart';
import '../../../core/utils/app_strings.dart';
import '../../account/widgets/custom_profile_button.dart';
import '../../auth/blocs/auth_bloc/auth_bloc.dart';
import '../../settings/widgets/settings_list_card.dart';

class DogsitterSettings extends StatefulWidget {
  const DogsitterSettings({super.key});

  @override
  State<DogsitterSettings> createState() => _DogsitterSettingsState();
}

class _DogsitterSettingsState extends State<DogsitterSettings> {
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
                    context.read<AuthBloc>().add(AuthEvent.userLogOut());
                    context.goNamed(RoutesNames.choseRole);
                  },
                  mainInfoTitle: AppString.logout,
                  icon: Icons.exit_to_app),
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

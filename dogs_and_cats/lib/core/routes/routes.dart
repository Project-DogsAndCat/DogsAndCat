import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/presentation/account/pages/profile_page.dart';
import 'package:dogs_and_cats/presentation/auth/pages/login_page.dart';
import 'package:dogs_and_cats/presentation/auth/pages/register_page.dart';
import 'package:dogs_and_cats/presentation/dogsitter/pages/dogsitter_page.dart';
import 'package:dogs_and_cats/presentation/scaffold_with_navbar/pages/scaffold_with_navbar.dart';
import 'package:dogs_and_cats/presentation/search/pages/search_page.dart';
import 'package:dogs_and_cats/presentation/settings/page/settings_page.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final session = getIt<SupabaseClient>().auth.currentSession;

final GoRouter router = GoRouter(
    initialLocation: session != null ? '/register' : '/search',
    routes: [
      GoRoute(
          name: RoutesNames.register,
          path: '/register',
          builder: (context, state) => const RegisterPage()),
      GoRoute(
          name: RoutesNames.login,
          path: '/login',
          builder: (context, state) => const LoginPage()),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              ScaffoldWithNavbar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: RoutesNames.search,
                  path: '/search',
                  builder: (context, state) => const SearchPage(),
                ),
              ],
            ),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutesNames.dogsitter,
                path: '/dogsitter_page',
                builder: (context, state) => const DogsitterPage(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutesNames.account,
                path: '/profile',
                builder: (context, state) => ProfilePage(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutesNames.settings,
                path: '/settings',
                builder: (context, state) => const SettingsPage(),
              )
            ]),
          ]),
    ]);

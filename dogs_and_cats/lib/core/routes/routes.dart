import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/presentation/account/pages/account.dart';
import 'package:dogs_and_cats/presentation/auth/pages/login_page.dart';
import 'package:dogs_and_cats/presentation/auth/pages/register_page.dart';
import 'package:dogs_and_cats/presentation/dogsitter/pages/dogsitter_page.dart';
import 'package:dogs_and_cats/presentation/scaffold_with_navbar/pages/scaffold_with_navbar.dart';
import 'package:dogs_and_cats/presentation/search/pages/search_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      name: RoutesNames.register,
      path: '/',
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
              path: '/search_page',
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
            path: '/account',
            builder: (context, state) => const AccountPage(),
          )
        ])
      ]),
]);

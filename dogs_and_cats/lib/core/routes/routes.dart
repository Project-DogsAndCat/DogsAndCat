import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/presentation/auth/pages/register_page.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/home/pages/home_page.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      name: RoutesNames.login,
      path: '/login',
      builder: (context, state) => const RegisterPage()),
  GoRoute(
      name: RoutesNames.home,
      path: '/home',
      builder: (context, state) => const HomePage()),
]);

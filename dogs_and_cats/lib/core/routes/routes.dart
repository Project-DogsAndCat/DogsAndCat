import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:dogs_and_cats/presentation/account/pages/profile_page.dart';
import 'package:dogs_and_cats/presentation/auth/pages/choose_role.dart';
import 'package:dogs_and_cats/presentation/auth/pages/login_page.dart';
import 'package:dogs_and_cats/presentation/auth/pages/register_page.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/pages/todo_page.dart';
import 'package:dogs_and_cats/presentation/dogsitter/want_to_be_a_dogditter/pages/contact_page.dart';
import 'package:dogs_and_cats/presentation/order/pages/order_details.dart';
import 'package:dogs_and_cats/presentation/pets/pages/pets_page.dart';
import 'package:dogs_and_cats/presentation/scaffold_with_navbar/pages/scaffold_with_navbar.dart';
import 'package:dogs_and_cats/presentation/services/pages/ordering_services_page.dart';
import 'package:dogs_and_cats/presentation/services/pages/service_page.dart';
import 'package:dogs_and_cats/presentation/settings/page/settings_page.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../presentation/dogsitter/account/pages/dogsitter_account.dart';
import '../../presentation/dogsitter/adding_information/pages/add_information.dart';
import '../../presentation/dogsitter/scaffold_with_navbar/pages/dogsitter_scaffold_with_navbar.dart';
import '../../presentation/dogsitter/settings/dogsitter_settings.dart';
import '../../presentation/order/pages/list_tasks.dart';
import '../welcome_pages/onboarding_view.dart';

final session = getIt<SupabaseClient>().auth.currentSession;

final GoRouter router = GoRouter(
    initialLocation: session == null
        ? '/onboardingView'
        : (session!.user.userMetadata?['role_user'] == 'dogsitter'
            ? '/todo'
            : '/services'),
    routes: [
      GoRoute(
          name: RoutesNames.onboardingView,
          path: '/onboardingView',
          builder: (context, state) => const OnboardingView()),
      GoRoute(
          name: RoutesNames.choseRole,
          path: '/choseRole',
          builder: (context, state) => const ChooseRole()),
      GoRoute(
          name: RoutesNames.register,
          path: '/register/:isUser',
          builder: (context, state) => RegisterPage(
                isUser: bool.parse(state.pathParameters['isUser']!),
              )),
      GoRoute(
          name: RoutesNames.login,
          path: '/login/:isUser',
          builder: (context, state) => LoginPage(
                isUser: bool.parse(state.pathParameters['isUser']!),
              )),
      GoRoute(
          name: RoutesNames.contact,
          path: '/contact',
          builder: (context, state) => const ContactPage()),
      GoRoute(
          name: RoutesNames.pets,
          path: '/pets/:backPage',
          builder: (context, state) => PetsPage(
                backPage: state.pathParameters['backPage']!,
              )),
      GoRoute(
          name: RoutesNames.orderingService,
          path: '/ordering',
          builder: (context, state) => const OrderingServicePage()),
      GoRoute(
          name: RoutesNames.orderDetails,
          path: '/orderDetails',
          builder: (context, state) {
            TaskModel task = state.extra as TaskModel;
            return OrderDetails(task: task);
          }),
      GoRoute(
          name: RoutesNames.addInformation,
          path: '/addInformation',
          builder: (context, state) => const AddInformation()),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              ScaffoldWithNavbar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: RoutesNames.services,
                  path: '/services',
                  builder: (context, state) => const ServicePage(),
                ),
              ],
            ),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutesNames.order,
                path: '/order',
                builder: (context, state) => const OrderPage(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutesNames.account,
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
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
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              DogsitterScaffoldWithNavbar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: RoutesNames.todo,
                  path: '/todo',
                  builder: (context, state) => const TodoPage(),
                ),
              ],
            ),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutesNames.dogsitterAccount,
                path: '/dogsitterAccount',
                builder: (context, state) => const DogsitterAccount(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutesNames.dogsitterSettings,
                path: '/dogsitterSettings',
                builder: (context, state) => const DogsitterSettings(),
              ),
            ]),
          ]),
    ]);

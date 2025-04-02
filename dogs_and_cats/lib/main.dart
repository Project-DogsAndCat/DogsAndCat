import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/core/routes/routes.dart';
import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:dogs_and_cats/presentation/account/blocs/map_search_bloc/map_search_bloc.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/auth/bloc/auth_bloc.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/cubit/theme_cubit.dart';
import 'data/repositories/map_search_repository.dart';
import 'presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'presentation/services/service_bloc/services_bloc.dart';

void main() async {
  await setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
        BlocProvider(
            create: (_) => getIt<ProfileBloc>()..add(ProfileEvent.load())),
        BlocProvider(
            create: (_) => getIt<ServicesBloc>()..add(ServicesEvent.load())),
        BlocProvider(create: (_) => getIt<OrderingServiceBloc>()),
        BlocProvider(create: (_) => getIt<PetBloc>()..add(PetEvent.load())),
        BlocProvider(
            create: (context) =>
                MapSearchBloc(repository: MapSearchRepositoryImpl())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Dogs & Cats',
        theme: state.isDark ? darkTheme : lightTheme,
        routerConfig: router,
      );
    });
  }
}

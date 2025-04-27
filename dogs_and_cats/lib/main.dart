import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/core/routes/routes.dart';
import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:dogs_and_cats/presentation/account/blocs/map_search_bloc/map_search_bloc.dart';
import 'package:dogs_and_cats/presentation/account/blocs/map_suggest_bloc/map_suggest_bloc.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/cubits/map_location_cubit.dart';
import 'package:dogs_and_cats/presentation/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:dogs_and_cats/presentation/auth/blocs/login_bloc/login_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/blocs/information_dog_sitter_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/cubits/image_cubit.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc.dart';
import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/dog_breed_bloc/dog_breed_bloc.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/theme/cubit/theme_cubit.dart';
import 'presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'presentation/services/service_bloc/services_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("ru_RU");
  await setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LoginBloc>()),
        BlocProvider(create: (_) => getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
        BlocProvider(
            create: (_) => getIt<ProfileBloc>()..add(ProfileEvent.load())),
        BlocProvider(
            create: (_) => getIt<ServicesBloc>()..add(ServicesEvent.load())),
        BlocProvider(create: (_) => getIt<OrderingServiceBloc>()),
        BlocProvider(create: (_) => getIt<OrderBloc>()..add(OrderEvent.load())),
        BlocProvider(create: (_) => getIt<PetBloc>()..add(PetEvent.load())),
        BlocProvider(create: (_) => getIt<MapSuggestBloc>()),
        BlocProvider(create: (_) => getIt<MapSearchBloc>()),
        BlocProvider(
            create: (_) => getIt<DogBreedBloc>()..add(DogBreedEvent.load())),
        BlocProvider(create: (_) => getIt<MapLocationCubit>()),
        BlocProvider(create: (_) => getIt<InformationDogSitterBloc>()),
        BlocProvider(create: (_) => getIt<ImageCubit>()),
        BlocProvider(create: (_) => getIt<TaskBloc>()..add(TaskEvent.load())),
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

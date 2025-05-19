import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/core/firebase_api/firebase_api.dart';
import 'package:dogs_and_cats/core/routes/routes.dart';
import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:dogs_and_cats/presentation/account/blocs/map_search_bloc/map_search_bloc.dart';
import 'package:dogs_and_cats/presentation/account/blocs/map_suggest_bloc/map_suggest_bloc.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/cubits/map_location_cubit.dart';
import 'package:dogs_and_cats/presentation/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:dogs_and_cats/presentation/auth/blocs/login_bloc/login_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/blocs/dog_sitter_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/cubits/image_cubit.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc.dart';
import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/dog_breed_bloc/dog_breed_bloc.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc/pet_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'firebase_options.dart';
import 'presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'presentation/services/service_bloc/services_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setup();

  await FirebaseApi().initFcm();
  await FirebaseApi().refreshToken();
  await FirebaseApi().initPushNotifications();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher',
              // other properties...
            ),
          ));
    }
  });

  initializeDateFormatting("ru_RU");

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LoginBloc>()),
        BlocProvider(create: (_) => getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
        BlocProvider(create: (_) => getIt<ProfileBloc>()),
        BlocProvider(
            create: (_) => getIt<ServicesBloc>()..add(ServicesEvent.load())),
        BlocProvider(create: (_) => getIt<OrderingServiceBloc>()),
        BlocProvider(create: (_) => getIt<OrderBloc>()),
        BlocProvider(create: (_) => getIt<PetBloc>()..add(PetEvent.load())),
        BlocProvider(create: (_) => getIt<MapSuggestBloc>()),
        BlocProvider(create: (_) => getIt<MapSearchBloc>()),
        BlocProvider(
            create: (_) => getIt<DogBreedBloc>()..add(DogBreedEvent.load())),
        BlocProvider(create: (_) => getIt<MapLocationCubit>()),
        BlocProvider(create: (_) => getIt<DogSitterBloc>()),
        BlocProvider(create: (_) => getIt<ImageCubit>()),
        BlocProvider(create: (_) => getIt<TaskBloc>()),
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
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ru', 'RU'), // Русский язык
          ],
          debugShowCheckedModeBanner: false,
          title: 'Dogs & Cats',
          theme: state.isDark ? darkTheme : lightTheme,
          routerConfig: router,
        );
      },
    );
  }
}

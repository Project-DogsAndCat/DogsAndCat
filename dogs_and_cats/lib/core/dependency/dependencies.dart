import 'package:dogs_and_cats/data/datasources/auth_remote_data_source.dart';
import 'package:dogs_and_cats/data/repositories/auth_repository_impl.dart';
import 'package:dogs_and_cats/data/repositories/person_repository_impl.dart';
import 'package:dogs_and_cats/data/repositories/pet_repository_impl.dart';
import 'package:dogs_and_cats/data/repositories/service_repository_impl.dart';
import 'package:dogs_and_cats/domain/repositories/auth_repository.dart';
import 'package:dogs_and_cats/domain/repositories/person_repository.dart';
import 'package:dogs_and_cats/domain/repositories/pet_repository.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/auth/bloc/auth_bloc.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc.dart';
import 'package:dogs_and_cats/presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'package:dogs_and_cats/presentation/services/service_bloc/services_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../secrets/secrets.dart';
import '../theme/cubit/theme_cubit.dart';
import '../theme/repository/settings_repository.dart';
import '../theme/repository/settings_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnnonKey);
  getIt.registerLazySingleton<SupabaseClient>(() => supabase.client);
  _initAuth();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  _initTheme();

  _initProfile();

  _initServices();

  _initPets();
}

void _initAuth() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      supabaseClient: getIt<SupabaseClient>()));

  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthRepository>()));
}

void _initTheme() {
  getIt.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(preferences: getIt<SharedPreferences>()));

  getIt.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(repository: getIt<SettingsRepository>()));
}

void _initProfile() {
  getIt.registerLazySingleton<PersonRepository>(
      () => PersonRepositoryImpl(supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<ProfileBloc>(
      () => ProfileBloc(repository: getIt<PersonRepository>()));
}

void _initServices() {
  getIt.registerLazySingleton<ServiceRepository>(
      () => ServiceRepositoryImpl(supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<ServicesBloc>(
      () => ServicesBloc(repository: getIt<ServiceRepository>()));

  getIt.registerLazySingleton<OrderingServiceBloc>(
      () => OrderingServiceBloc(repository: getIt<ServiceRepository>()));
}

void _initPets() {
  getIt.registerLazySingleton<PetRepository>(
      () => PetRepositoryImpl(supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<PetBloc>(() => PetBloc(
      repository: getIt<PetRepository>(),
      supabaseClient: getIt<SupabaseClient>()));
}

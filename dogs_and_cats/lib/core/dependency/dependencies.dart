import 'package:dogs_and_cats/data/datasources/auth_remote_data_source.dart';
import 'package:dogs_and_cats/data/repositories/auth_repository_impl.dart';
import 'package:dogs_and_cats/data/repositories/dog_breed_repository_impl.dart';
import 'package:dogs_and_cats/data/repositories/dog_sitter_repositort_impl.dart';
import 'package:dogs_and_cats/data/repositories/order_repository_impl.dart';
import 'package:dogs_and_cats/data/repositories/person_repository_impl.dart';
import 'package:dogs_and_cats/data/repositories/pet_repository_impl.dart';
import 'package:dogs_and_cats/data/repositories/service_repository_impl.dart';
import 'package:dogs_and_cats/domain/repositories/auth_repository.dart';
import 'package:dogs_and_cats/domain/repositories/dog_breed_repository.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:dogs_and_cats/domain/repositories/location_repository.dart';
import 'package:dogs_and_cats/domain/repositories/map_search_repository.dart';
import 'package:dogs_and_cats/domain/repositories/person_repository.dart';
import 'package:dogs_and_cats/domain/repositories/pet_repository.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/auth/bloc/auth_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/blocs/information_dog_sitter_bloc.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/dog_breed_bloc/dog_breed_bloc.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc/pet_bloc.dart';
import 'package:dogs_and_cats/presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'package:dogs_and_cats/presentation/services/service_bloc/services_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/repositories/location_reposory_impl.dart';
import '../../data/repositories/map_search_repository_impl.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/services/map_service.dart';
import '../../presentation/account/blocs/map_search_bloc/map_search_bloc.dart';
import '../../presentation/account/blocs/map_suggest_bloc/map_suggest_bloc.dart';
import '../../presentation/account/cubits/map_location_cubit.dart';
import '../../presentation/order/order_bloc/order_bloc.dart';
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

  _initOrder();

  _initPets();

  _initMapSuggest();

  _initMapSearch();

  _initDogBreed();

  _initMapLocation();

  _initDogSitter();
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

void _initOrder() {
  getIt.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<OrderBloc>(() => OrderBloc(
      orderRepository: getIt<OrderRepository>(),
      serviceRepository: getIt<ServiceRepository>()));
}

void _initPets() {
  getIt.registerLazySingleton<PetRepository>(
      () => PetRepositoryImpl(supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<PetBloc>(() => PetBloc(
      repository: getIt<PetRepository>(),
      supabaseClient: getIt<SupabaseClient>()));
}

void _initDogSitter() {
  getIt.registerLazySingleton<DogSitterRepository>(
      () => DogSitterRepositoryImpl(supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<InformationDogSitterBloc>(
      () => InformationDogSitterBloc(repository: getIt<DogSitterRepository>()));
}

void _initMapSuggest() {
  getIt.registerLazySingleton<MapSearchRepository>(
      () => MapSearchRepositoryImpl());

  getIt.registerLazySingleton<MapSuggestBloc>(
      () => MapSuggestBloc(repository: getIt<MapSearchRepository>()));
}

void _initMapSearch() {
  getIt.registerLazySingleton<MapSearchBloc>(
      () => MapSearchBloc(repository: getIt<MapSearchRepository>()));
}

void _initDogBreed() {
  getIt.registerLazySingleton<DogBreedRepository>(
      () => DogBreedRepositoryImpl());

  getIt.registerLazySingleton<DogBreedBloc>(
      () => DogBreedBloc(repository: getIt<DogBreedRepository>()));
}

void _initMapLocation() {
  getIt.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl());

  getIt.registerLazySingleton<MapService>(
      () => MapService(locationRepository: getIt<LocationRepository>()));

  getIt.registerLazySingleton<MapLocationCubit>(
      () => MapLocationCubit(service: getIt<MapService>()));
}

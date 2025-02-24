import 'package:dogs_and_cats/data/datasources/auth_remote_data_source.dart';
import 'package:dogs_and_cats/data/repositories/auth_repository_impl.dart';
import 'package:dogs_and_cats/domain/repositories/auth_repository.dart';
import 'package:dogs_and_cats/presentation/auth/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../secrets/secrets.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnnonKey);
  getIt.registerLazySingleton(() => supabase.client);
  _initAuth();
}

void _initAuth() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(supabaseClient: getIt()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: getIt()));

  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt()));
}

import 'package:dogs_and_cats/data/datasources/auth_remote_data_source.dart';
import 'package:dogs_and_cats/data/repositories/auth_repository_impl.dart';
import 'package:dogs_and_cats/presentation/auth/bloc/auth_bloc.dart';
import 'package:dogs_and_cats/presentation/auth/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/secrets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnnonKey);
  final supabase = Supabase.instance.client;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            AuthRepositoryImpl(
              remoteDataSource:
                  AuthRemoteDataSourceImpl(supabaseClient: supabase),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: RegisterPage(),
    );
  }
}

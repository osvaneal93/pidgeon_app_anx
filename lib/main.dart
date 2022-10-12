import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pidgeon_app/app.dart';
import 'package:pidgeon_app/src/data/repositories/auth_repository.dart';
import 'package:pidgeon_app/src/ui/bloc/app/app_bloc.dart';
import 'package:pidgeon_app/src/ui/cubit/login/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RepositoryProvider(
    create: (context) => AuthRepository(),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppBloc(authRepository: context.read<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(context.read<AuthRepository>()),
        ),
      ],
      child: MyApp.create(),
    ),
  ));
}

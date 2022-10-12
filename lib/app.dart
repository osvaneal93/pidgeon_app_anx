import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pidgeon_app/src/ui/bloc/app/app_bloc.dart';
import 'package:pidgeon_app/src/ui/routes/route_generator.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static Widget create() {
    return BlocListener<AppBloc, AppState>(
      listener: ((context, state) {
        print('ESTADOOOOOOO $state');

        if (state is AuthSignedOut) {
          print('ESTAMOS EN  $state');
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil('/login', (route) => false);
        } else if (state is AuthSignedIn) {
          print('ESTAMOS EN  $state');
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil('/home', (route) => false);
        } else if (state is AuthError) {
          print('TENEMOS UN ERROR MI SENIOR ${state.message}');
        }
      }),
      child: MyApp(),
    );
  }

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

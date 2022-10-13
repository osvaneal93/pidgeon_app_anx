import 'package:flutter/material.dart';
import 'package:pidgeon_app/src/ui/views/auth/login_view.dart';
import 'package:pidgeon_app/src/ui/views/lessons/lesson_index.dart';
import 'package:pidgeon_app/src/ui/views/principal/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => LessonIndex(),
        );

      case '/login':
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );

      case '/lessons':
        return MaterialPageRoute(
          builder: (context) => LessonIndex(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}

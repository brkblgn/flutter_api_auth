import 'package:flutter/material.dart';
import 'package:flutter_api_auth/presentation/views/authentication/login_view.dart';
import 'package:flutter_api_auth/presentation/views/authentication/signup_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        {
          return MaterialPageRoute(builder: (_) => LoginView());
        }
      case "/signup":
        {
          return MaterialPageRoute(builder: (_) => SignupView());
        }
      default:
    }
  }
}

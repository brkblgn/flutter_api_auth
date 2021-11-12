import 'package:flutter/material.dart';
import 'package:flutter_api_auth/app/routes/app_routes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "/login",
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

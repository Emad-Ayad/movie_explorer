import 'package:flutter/material.dart';

import 'core/helper/routes_generator.dart';
import 'features/auth/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      onGenerateRoute: routerGenerator,
      initialRoute: LoginView.routeName,
      home: LoginView(),
    );
  }
}

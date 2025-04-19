import 'package:flutter/material.dart';

import '../../features/auth/view/login_view.dart';
import '../../features/home/presentation/view/home_view.dart';

Route<dynamic> routerGenerator(RouteSettings settings) {
  switch (settings.name) {

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

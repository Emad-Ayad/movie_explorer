import 'package:flutter/material.dart';

import '../../features/auth/view/login_view.dart';
import '../../features/home/data/models/movie_model.dart';
import '../../features/home/presentation/view/details_view.dart';
import '../../features/home/presentation/view/home_view.dart';

Route<dynamic> routerGenerator(RouteSettings settings) {
  switch (settings.name) {

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    case DetailsView.routeName:
      final movie = settings.arguments as Movie; // Cast the passed movie
      return MaterialPageRoute(
        builder: (_) => DetailsView(movie: movie), // No Cubit needed
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

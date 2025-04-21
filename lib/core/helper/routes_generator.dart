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
      final movieId = settings.arguments as int?;
      if (movieId == null) {
        return _buildErrorRoute(settings, 'Missing movieId parameter');
      }
      return _buildRoute(
        settings,
        DetailsView(movieId: movieId),
        maintainState: true,
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

MaterialPageRoute _buildRoute(
    RouteSettings settings,
    Widget builder, {
      bool maintainState = false,
    }) {
  return MaterialPageRoute(
    settings: settings, // Preserve original settings
    builder: (_) => builder,
    maintainState: maintainState,
  );
}

MaterialPageRoute _buildErrorRoute(RouteSettings settings, String message) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text(message)),
    ),
  );
}
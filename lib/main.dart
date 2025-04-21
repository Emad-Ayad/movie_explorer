import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helper/routes_generator.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/deeplink_service.dart';
import 'core/services/get_it.dart';
import 'core/services/notification_service.dart';
import 'features/auth/view/login_view.dart';
import 'features/home/data/repos/movies_repo.dart';
import 'features/home/presentation/cubit/movies_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = BlocObserverService();
  setup();

  await NotificationService().initNotification();
  NotificationService().handleInitialNotification();
  DeepLinkService().initialize(navigatorKey);

  runApp( MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final moviesCubit = MoviesCubit(getIt.get<MoviesRepo>());
    return BlocProvider.value(
      value: moviesCubit,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        onGenerateRoute: routerGenerator,
        initialRoute: LoginView.routeName,
      ),
    );
  }
}

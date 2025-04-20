import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/core/services/get_it.dart';
import 'package:movie_explorer/features/home/data/repos/movies_repo.dart';
import 'package:movie_explorer/features/home/presentation/cubit/movies_cubit.dart';
import 'package:movie_explorer/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MoviesCubit(getIt.get<MoviesRepo>()),
        child: HomeViewBody(),
      ),
    );
  }
}

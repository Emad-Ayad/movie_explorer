import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_explorer/core/widgets/movie_item.dart';

import '../../cubit/movies_cubit.dart';
import '../details_view.dart';
import 'custom_search_text_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchTextField(
              searchController: searchController,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesFailure) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.message),
                          const SizedBox(height: 16),
                          //for testing
                          ElevatedButton(
                            onPressed: () =>
                                context.read<MoviesCubit>().getPopularMovies(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is MoviesSuccess) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: state.movies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DetailsView.routeName,
                              arguments: state.movies[index], // Pass the whole movie
                            );
                          },
                          child: MovieItem(
                            imageUrl: state.movies[index].posterPath,
                            title: state.movies[index].title,
                            releaseYear: state.movies[index].releaseYear,
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

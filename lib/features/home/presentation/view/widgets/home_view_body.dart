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
  void dispose() {
    searchController.dispose();
    super.dispose();
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
              onChanged: (query) {
                if (query.isEmpty) {
                  context.read<MoviesCubit>().getPopularMovies();
                } else {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    if (query == searchController.text) {
                      context.read<MoviesCubit>().searchMovies(query);
                    }
                  });
                }
              },
              onCleared: () {
                context.read<MoviesCubit>().getPopularMovies();
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<MoviesCubit, MoviesState>(
                buildWhen: (previous, current) {
                  // Only rebuild for home-related states
                  return current is MoviesInitial ||
                      current is MoviesLoading ||
                      current is MoviesSuccess ||
                      current is MoviesFailure;
                },
                builder: (context, state) {
                  if (state is MoviesFailure) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Movie not found please try again"),
                          const SizedBox(height: 16),
                          //for testing
                          ElevatedButton(
                            onPressed: () {
                              searchController.text.isEmpty
                                  ? context
                                      .read<MoviesCubit>()
                                      .getPopularMovies()
                                  : context
                                      .read<MoviesCubit>()
                                      .searchMovies(searchController.text);
                            },
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
                          onTap: () async {
                            await Navigator.pushNamed(
                                context, DetailsView.routeName,
                                arguments: state.movies[index].id);
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

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_explorer/core/constants/app_text_styles.dart';
import '../../data/models/movie_model.dart';

class DetailsView extends StatelessWidget {
  final Movie movie;

  const DetailsView({super.key, required this.movie});

  static const String routeName = 'details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w1280${movie.backdropPath}',
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    Container(color: const Color(0xFF1E1E1E)),
                errorWidget: (_, __, ___) =>
                    const Icon(Icons.error, color: Colors.white),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            width: 120,
                            height: 180,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Container(color: const Color(0xFF1E1E1E)),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.star,
                                      size: 16, color: Colors.black),
                                  const SizedBox(width: 4),
                                  Text(
                                    movie.voteAverage.toStringAsFixed(1),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  " ${movie.releaseYear.split('-')[0]}",
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text('Overview', style: AppTextStyles.subtitle1),
                  const SizedBox(height: 8),
                  Text(movie.overview, style: AppTextStyles.bodyText2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

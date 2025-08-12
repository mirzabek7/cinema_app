import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/movie_model.dart';

class RecommendedMoviesList extends StatelessWidget {
  final List<MovieModel> movies;
  final int categoryId;
  const RecommendedMoviesList({
    required this.movies,
    required this.categoryId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 9 / 14,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (categoryId != 1) {
              context.push('/movie-detail', extra: movies[index]);
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              movies[index].posterUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: movies.length,
    );
  }
}

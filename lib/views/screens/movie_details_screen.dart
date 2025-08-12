import 'package:cinema_app/helpers/movie_icons.dart';
import 'package:cinema_app/models/movie_model.dart';
import 'package:cinema_app/utils/custom_colors.dart';
import 'package:cinema_app/view_models/favorite_movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/movie_detail_top_section.dart';
import '../widgets/movie_main_info.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoriteMoviesViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryBackground,
        title: const Text(
          'Detail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.addToFavorites(movie);
            },
            icon: Icon(Movie.save, size: 24, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailTopSection(movie: movie),
            Padding(
              padding: const EdgeInsets.only(top: 78, right: 24, left: 24),
              child: Column(
                spacing: 24,
                children: [
                  MovieMainInfo(movie: movie),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About Movie',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      movie.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

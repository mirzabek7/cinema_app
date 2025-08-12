import 'package:cinema_app/models/movie_model.dart';

import '../../helpers/movie_icons.dart';
import '../../utils/custom_colors.dart';
import 'package:flutter/material.dart';

class MovieDetailTopSection extends StatelessWidget {
  const MovieDetailTopSection({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Image.network(
            movie.backdropUrl,
            width: double.infinity,
            height: deviceHeight * 0.25,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withValues(alpha: 0.48),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                spacing: 4,
                children: [
                  Icon(Movie.star, size: 16, color: CustomColors.orange),
                  Text(
                    movie.rating.toString(),
                    style: TextStyle(
                      color: CustomColors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          bottom: -55,
          child: Row(
            spacing: 12,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  movie.posterUrl,
                  width: 95,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 48),
                child: Text(
                  movie.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

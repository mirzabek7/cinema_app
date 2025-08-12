import 'package:flutter/material.dart';

import '../../helpers/movie_icons.dart';
import '../../models/movie_model.dart';
import '../../utils/custom_colors.dart';
import 'watch_list_tem_param.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          spacing: 16,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.network(
                movie.posterUrl,
                width: 110,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(Movie.star, size: 16, color: CustomColors.orange),
                      Text(
                        '${movie.rating}',
                        style: TextStyle(
                          color: CustomColors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  WatchListItemParam(
                    paramIcon: Icon(
                      Movie.ticket,
                      size: 16,
                      color: Colors.white,
                    ),
                    paramText: movie.genres.first,
                  ),
                  WatchListItemParam(
                    paramIcon: Icon(
                      Movie.calendarBlank,
                      size: 16,
                      color: Colors.white,
                    ),
                    paramText: movie.year.toString(),
                  ),
                  WatchListItemParam(
                    paramIcon: Icon(Movie.clock, size: 16, color: Colors.white),
                    paramText: '${movie.movieLength} minutes',
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

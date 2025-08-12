import 'package:cinema_app/models/movie_model.dart';
import 'package:flutter/material.dart';

import '../../helpers/movie_icons.dart';
import '../../utils/custom_colors.dart';
import 'movie_info_item.dart';

class MovieMainInfo extends StatelessWidget {
  const MovieMainInfo({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MovieInfoItem(
          title: movie.year.toString(),
          itemIcon: Icon(
            Movie.calendarBlank,
            color: CustomColors.textColor,
            size: 16,
          ),
        ),
        SizedBox(
          height: 16,
          child: VerticalDivider(
            color: CustomColors.darkGrey,
            thickness: 1,
            width: 1,
          ),
        ),
        MovieInfoItem(
          title: '${movie.movieLength} Minutes',
          itemIcon: Icon(Movie.clock, color: CustomColors.textColor, size: 16),
        ),
        SizedBox(
          height: 16,
          child: VerticalDivider(
            color: CustomColors.darkGrey,
            thickness: 1,
            width: 1,
          ),
        ),
        MovieInfoItem(
          title:
              '${movie.genres[0][0].toUpperCase()}${movie.genres[0].substring(1)}',
          itemIcon: Icon(Movie.ticket, color: CustomColors.textColor, size: 16),
        ),
      ],
    );
  }
}

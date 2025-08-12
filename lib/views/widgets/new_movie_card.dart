import 'package:cinema_app/models/movie_model.dart';
import 'package:cinema_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewMovieCard extends StatelessWidget {
  const NewMovieCard({
    super.key,
    required this.itemId,
    required this.movieModel,
  });
  final int itemId;
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/movie-detail', extra: movieModel),
      child: SizedBox(
        height: 250,
        width: 165,
        child: Align(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                left: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    movieModel.posterUrl,
                    width: 145,
                    height: 210,
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                left: 0,
                child: Stack(
                  children: [
                    Text(
                      itemId.toString(),
                      style: TextStyle(
                        fontSize: 100,
                        foreground:
                            Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = CustomColors.activeColor,
                      ),
                    ),
                    Text(
                      itemId.toString(),
                      style: TextStyle(
                        fontSize: 100,
                        color: CustomColors.primaryBackground,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

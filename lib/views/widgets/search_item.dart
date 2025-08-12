import 'package:go_router/go_router.dart';

import '../../models/movie_model.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (movie.name.isNotEmpty && movie.posterUrl.isNotEmpty) {
          context.push('/movie-detail', extra: movie);
        }
      },
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          spacing: 5,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child:
                    movie.posterUrl.isNotEmpty
                        ? Image.network(
                          movie.posterUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                        : Image.asset(
                          'assets/images/not-found.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
              ),
            ),
            Text(
              movie.name.isNotEmpty ? movie.name : 'Not found',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

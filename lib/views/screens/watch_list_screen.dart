import 'package:cinema_app/view_models/favorite_movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../utils/custom_colors.dart';
import '../widgets/watch_list_item.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoriteMoviesViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryBackground,
        title: const Text(
          'Watch list',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.push(
                  '/movie-detail',
                  extra: viewModel.favoriteMovies[index],
                );
              },
              child: WatchListItem(movie: viewModel.favoriteMovies[index]),
            );
          },
          itemCount: viewModel.favoriteMovies.length,
        ),
      ),
    );
  }
}

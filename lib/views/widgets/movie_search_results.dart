import 'package:flutter/material.dart';

import '../../view_models/search_view_model.dart';
import 'search_item.dart';

class MovieSearchResults extends StatelessWidget {
  const MovieSearchResults({super.key, required this.viewModel});

  final SearchViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isSearching) {
      return Center(child: CircularProgressIndicator(color: Colors.white));
    } else if (viewModel.movies.isNotEmpty) {
      return Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 12,
            crossAxisSpacing: 16,
            mainAxisSpacing: 24,
          ),
          itemBuilder: (context, index) {
            return SearchItem(movie: viewModel.movies[index]);
          },
          itemCount: viewModel.movies.length,
        ),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 72),
          Icon(Icons.search_off_rounded, size: 56, color: Colors.grey),
          Text(
            'Nothing found',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      );
    }
  }
}

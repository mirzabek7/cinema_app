import 'package:cinema_app/view_models/search_view_model.dart';
import 'package:flutter/material.dart';

import 'search_history_item.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key, required this.viewModel});
  final SearchViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isSearching) {
      return Center(child: CircularProgressIndicator(color: Colors.white));
    } else if (viewModel.history.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => viewModel.search(viewModel.history[index].title),
              child: SearchHistoryItem(
                historyModel: viewModel.history[index],
                viewModel: viewModel,
              ),
            );
          },
          itemCount: viewModel.history.length,
        ),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 72),
          Icon(Icons.search_off_rounded, size: 56, color: Colors.grey),
          Text(
            'Search history is empty',
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

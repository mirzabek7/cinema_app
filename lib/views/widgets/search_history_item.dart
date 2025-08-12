import 'package:cinema_app/models/search_history_model.dart';
import 'package:cinema_app/view_models/search_view_model.dart';
import 'package:flutter/material.dart';

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    super.key,
    required this.historyModel,
    required this.viewModel,
  });
  final SearchHistoryModel historyModel;
  final SearchViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              historyModel.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            // Text(
            //   '2002',
            //   style: TextStyle(
            //     color: Colors.grey,
            //     fontSize: 12,
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.w500,
            //   ),
            // // ),
            // const SizedBox(height: 8),
          ],
        ),
        IconButton(
          onPressed: () => viewModel.deleteSearch(historyModel),
          icon: Icon(Icons.close_rounded, size: 20, color: Colors.grey),
        ),
      ],
    );
  }
}

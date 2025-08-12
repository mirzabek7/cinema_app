import 'package:cinema_app/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/custom_colors.dart';
import '../widgets/custom_input_style.dart';
import '../widgets/movie_search_results.dart';
import '../widgets/search_history.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchViewModel>().getHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 12,
              children: [
                TextFormField(
                  controller: _controller,
                  cursorColor: CustomColors.activeColor,
                  decoration: CustomInputStyle('Search'),
                  style: TextStyle(color: Colors.white),
                  textInputAction: TextInputAction.search,
                  onChanged: (value) => viewModel.checkInput(_controller.text),
                  onFieldSubmitted:
                      (value) => viewModel.search(_controller.text),
                ),

                if (viewModel.isInputEmpty)
                  SearchHistory(viewModel: viewModel)
                else
                  MovieSearchResults(viewModel: viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cinema_app/utils/custom_colors.dart';
import 'package:cinema_app/view_models/home_view_model.dart';
import 'package:cinema_app/views/widgets/custom_input_style.dart';
import 'package:cinema_app/views/widgets/new_movie_card.dart';
import 'package:cinema_app/views/widgets/recommended_movies_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().loadMovies();
      context.read<HomeViewModel>().loadMoviesByCategory('now');
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primaryBackground,
          title: const Text(
            'What do you want to watch?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  cursorColor: CustomColors.activeColor,
                  decoration: CustomInputStyle('Search'),
                ),
                const SizedBox(height: 16),
                if (viewModel.isLoading)
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                else
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final movie = viewModel.movies[index];
                        return NewMovieCard(
                          itemId: index + 1,
                          movieModel: movie,
                        );
                      },
                      itemCount: viewModel.movies.length,
                      shrinkWrap: true,
                    ),
                  ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: TabBar(
                    controller: _tabController,
                    onTap: (value) {
                      viewModel.changeIndex(_tabController.index);
                    },
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    dividerHeight: 0,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    indicatorColor: CustomColors.inputColor,
                    tabs: [
                      Tab(child: Text('Now playing')),
                      Tab(child: Text('Upcoming')),
                      Tab(child: Text('Top rated')),
                      Tab(child: Text('Popular')),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (viewModel.isCategoryMovieLoading)
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                else
                  IndexedStack(
                    index: viewModel.currentTabIndex,
                    children: [
                      RecommendedMoviesList(
                        movies: viewModel.moviesByCategory,
                        categoryId: viewModel.currentTabIndex,
                      ),
                      RecommendedMoviesList(
                        movies: viewModel.moviesByCategory,
                        categoryId: viewModel.currentTabIndex,
                      ),
                      RecommendedMoviesList(
                        movies: viewModel.moviesByCategory,
                        categoryId: viewModel.currentTabIndex,
                      ),
                      RecommendedMoviesList(
                        movies: viewModel.moviesByCategory,
                        categoryId: viewModel.currentTabIndex,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

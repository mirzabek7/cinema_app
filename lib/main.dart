import 'data/repositories/favorite_movies_repository.dart';
import 'data/repositories/movie_repository.dart';
import 'data/repositories/search_history_repository.dart';
import 'data/services/movie_api_service.dart';
import 'utils/custom_colors.dart';
import 'utils/routes.dart';
import 'view_models/favorite_movies_view_model.dart';
import 'view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_models/search_view_model.dart';

void main() {
  final MovieApiService service = MovieApiService();
  final MovieRepository repository = MovieRepository(service);
  final SearchHistoryRepository searchHistoryRepository =
      SearchHistoryRepository();
  final FavoriteMoviesRepository favoriteMoviesRepository =
      FavoriteMoviesRepository();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) =>
                  FavoriteMoviesViewModel(favoriteMoviesRepository)
                    ..loadFavoriteMovies(),
        ),
        ChangeNotifierProvider(create: (_) => HomeViewModel(repository)),
        ChangeNotifierProvider(
          create: (_) => SearchViewModel(repository, searchHistoryRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: CustomColors.primaryBackground,
      ),
      routerConfig: router,
    );
  }
}

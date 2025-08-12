import 'package:cinema_app/models/movie_model.dart';
import 'package:cinema_app/views/screens/home_screen.dart';
import 'package:cinema_app/views/screens/initial_screen.dart';
import 'package:cinema_app/views/screens/movie_details_screen.dart';
import 'package:cinema_app/views/screens/search_screen.dart';
import 'package:cinema_app/views/screens/watch_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, navigationShell, children) {
        return InitialScreen(navigationShell: children);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) {
                return MaterialPage(key: state.pageKey, child: HomeScreen());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              pageBuilder: (context, state) {
                return MaterialPage(key: state.pageKey, child: SearchScreen());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/watch-list',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: WatchListScreen(),
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/movie-detail',
      builder: (context, state) {
        final MovieModel movie = state.extra as MovieModel;
        return MovieDetailsScreen(movie: movie);
      },
    ),
  ],
  initialLocation: '/home',
);

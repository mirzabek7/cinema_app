import 'package:cinema_app/helpers/movie_icons.dart';
import 'package:cinema_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          height: 78,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: CustomColors.activeColor, width: 0.5),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: CustomColors.primaryBackground,
            useLegacyColorScheme: false,
            currentIndex: navigationShell.currentIndex,
            onTap: (value) => navigationShell.goBranch(value),
            unselectedItemColor: CustomColors.disableColor,
            selectedItemColor: CustomColors.activeColor,
            unselectedFontSize: 16,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Movie.home,
                  size: 24,
                  color: CustomColors.activeColor,
                ),
                icon: Icon(
                  Movie.home,
                  size: 24,
                  color: CustomColors.disableColor,
                ),

                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Movie.searchLeft,
                  size: 24,
                  color: CustomColors.activeColor,
                ),
                icon: Icon(
                  Movie.searchLeft,
                  size: 24,
                  color: CustomColors.disableColor,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Movie.save,
                  size: 24,
                  color: CustomColors.activeColor,
                ),
                icon: Icon(
                  Movie.save,
                  size: 24,
                  color: CustomColors.disableColor,
                ),
                label: 'Watch List',
              ),
            ],
            mouseCursor: SystemMouseCursors.basic, // Убирает эффект курсора
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}

// Place fonts/movie.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: movie
//      fonts:
//       - asset: fonts/movie.ttf
import 'package:flutter/widgets.dart';

class Movie {
  Movie._();

  static const String _fontFamily = 'MovieIcons';

  static const IconData star = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData ticket = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData clock = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData calendarBlank = IconData(
    0xe903,
    fontFamily: _fontFamily,
  );
  static const IconData save = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData searchLeft = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData searchRight = IconData(0xe907, fontFamily: _fontFamily);
}

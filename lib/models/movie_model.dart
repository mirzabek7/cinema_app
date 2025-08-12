import 'dart:convert';

class MovieModel {
  final int id;
  final double rating;
  final String description;
  final String shortDescription;
  final String name;
  final String alternativeName;
  final int movieLength;
  final int year;
  final String backdropUrl;
  final String posterUrl;
  final List<String> genres;
  final List<String> countries;

  const MovieModel({
    required this.id,
    required this.rating,
    required this.description,
    required this.shortDescription,
    required this.name,
    required this.alternativeName,
    required this.movieLength,
    required this.year,
    required this.backdropUrl,
    required this.posterUrl,
    required this.genres,
    required this.countries,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? '',
      rating: (json['rating']?['imdb'] as num?)?.toDouble() ?? 0,
      description: json['description'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      name: json['name'] ?? '',
      alternativeName: json['alternativeName'] ?? '',
      movieLength:
          (json['movieLength']?.toString() ?? 'null') == 'null'
              ? 0
              : json['movieLength'],
      year: (json['year']?.toString() ?? 'null') == 'null' ? 0 : json['year'],
      backdropUrl: json['backdrop']?['url'] ?? json['poster']?['url'] ?? '',
      posterUrl: json['poster']?['url'] ?? '',
      genres:
          (json['genres'] as List?)
              ?.map((genre) => genre['name'].toString())
              .toList() ??
          [],
      countries:
          (json['countries'] as List?)
              ?.map((country) => country['name'].toString())
              .toList() ??
          [],
    );
  }

  factory MovieModel.fromLocalJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      description: json['description'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      name: json['name'] ?? '',
      alternativeName: json['alternativeName'] ?? '',
      movieLength:
          (json['movieLength']?.toString() ?? 'null') == 'null'
              ? 0
              : json['movieLength'],
      year: (json['year']?.toString() ?? 'null') == 'null' ? 0 : json['year'],
      backdropUrl: json['backdropUrl'] ?? json['posterUrl'] ?? '',
      posterUrl: json['posterUrl'] ?? '',
      genres: List<String>.from(jsonDecode(json['genres'] as String)),
      countries: List<String>.from(jsonDecode(json['countries'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'description': description,
      'shortDescription': shortDescription,
      'name': name,
      'alternativeName': alternativeName,
      'movieLength': movieLength,
      'year': year,
      'backdropUrl': backdropUrl,
      'posterUrl': posterUrl,
      'genres': jsonEncode(genres),
      'countries': jsonEncode(countries),
    };
  }
}

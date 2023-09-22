// To parse this JSON data, do
//
//     final tv = tvFromJson(jsonString);

import 'dart:convert';

Tv tvFromJson(String str) => Tv.fromJson(json.decode(str));

class Tv {
  int? page;
  List<Result1>? results;
  int? totalPages;
  int? totalResults;

  Tv({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory Tv.fromJson(Map<String, dynamic> json) => Tv(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result1>.from(
                json["results"]!.map((x) => Result1.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Result1 {
  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  Result1({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  factory Result1.fromJson(Map<String, dynamic> json) => Result1(
        backdropPath: json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}

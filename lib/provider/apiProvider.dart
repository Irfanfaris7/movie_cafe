import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/Model/castmodel.dart';
import 'package:movie_cafe/Model/genre_model.dart';
import 'package:movie_cafe/Model/movie_model.dart';
import 'package:movie_cafe/Model/tvmodel.dart';

import '../services/movieServices.dart';

final apiProvider = Provider<ApiTrending>((ref) => ApiTrending());

final trendingMovieProvider = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiProvider).getposts();
});

class ImageKey {
  static String imageTrend = 'https://image.tmdb.org/t/p/w500';
}

final castProvider = FutureProvider.family<CastModel?, int>((ref, movieId) {
  return ref.read(apiProvider).getCasts(movieId);
});

final popularProvider = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiProvider).getpopular();
});

final nowPlayingProvider = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiProvider).getnowplaying();
});

final comingsoonProvider = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiProvider).getcomingsoon();
});

final topRatedProvider = FutureProvider<MovieModel?>((ref) async {
  return ref.read(apiProvider).getTopRated();
});

final tvProvider = FutureProvider<Tv?>((ref) async {
  return ref.watch(apiProvider).getTv();
});

final malayalamProvider = FutureProvider<MovieModel?>((ref) async {
  return ref.watch(apiProvider).getMalayalam();
});

final tamilProvider = FutureProvider<MovieModel?>((ref) async {
  return ref.watch(apiProvider).getTamil();
});

final hindiProvider = FutureProvider<MovieModel?>((ref) async {
  return ref.watch(apiProvider).getHindi();
});

final kannadaProvider = FutureProvider<MovieModel?>((ref) async {
  return ref.watch(apiProvider).getKannada();
});

final movienameProvider = StateProvider<String>((ref) {
  return "";
});
final searchProvider = FutureProvider<MovieModel?>((ref) async {
  return ref.watch(apiProvider).getSearch(ref.watch(movienameProvider));
});

final genreprovider = FutureProviderFamily<GenreModel?, int>((ref, genreId) {
  return ref.watch(apiProvider).getGenre(genreId);
});

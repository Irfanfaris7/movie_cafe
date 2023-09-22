import 'dart:convert';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_cafe/Model/castmodel.dart';
import 'package:movie_cafe/Model/genre_model.dart';

import 'package:movie_cafe/Model/movie_model.dart';

import '../Model/tvmodel.dart';

class ApiTrending {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': '08b0171326f9dc995d49e1447cac7ef4'}));

  Future<MovieModel?> getposts() async {
    try {
      Response response = await dio.get('/trending/movie/day');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<CastModel?> getCasts(int movieId) async {
    try {
      Response response = await dio.get('/movie/$movieId/credits');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return castModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getpopular() async {
    try {
      Response response = await dio.get('/movie/popular');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getnowplaying() async {
    try {
      Response response = await dio.get('/movie/now_playing');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getcomingsoon() async {
    try {
      Response response = await dio.get('/movie/upcoming');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getTopRated() async {
    try {
      Response response = await dio.get('/movie/top_rated');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<Tv?> getTv() async {
    try {
      Response response = await dio.get('/tv/top_rated');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return tvFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getMalayalam() async {
    try {
      Response response = await dio.get('/discover/movie',
          queryParameters: {"with_original_language": "ml"});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getTamil() async {
    try {
      Response response = await dio.get('/discover/movie',
          queryParameters: {"with_original_language": "ta"});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getHindi() async {
    try {
      Response response = await dio.get('/discover/movie',
          queryParameters: {"with_original_language": "hi"});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getKannada() async {
    try {
      Response response = await dio.get('/discover/movie',
          queryParameters: {"with_original_language": "kn"});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getSearch(String moviename) async {
    try {
      Response response =
          await dio.get('/search/movie', queryParameters: {'query': moviename});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return MovieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<GenreModel?> getGenre(int genreId) async {
    try {
      Response response = await dio.get('/movie/$genreId');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return genreFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }
}

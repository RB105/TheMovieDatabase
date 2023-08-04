import 'package:dio/dio.dart';
import 'package:tmdb/core/config/dio_catch_error.dart';
import 'package:tmdb/core/config/dio_config.dart';
import 'package:tmdb/core/config/network_config.dart';
import 'package:tmdb/core/constants/discover/movie_list_url.dart';
import 'package:tmdb/model/discover_movies_model.dart';
import 'package:tmdb/model/upcoming_movies_model.dart';

class DiscoverService with DioConfig, DioCatchException {
  // get all movies
  Future<NetworkResponse> getAllMovies() async {
    try {
      Response response = await createRequest().get(
        DiscoverUrl.allMovies,
      );
      if (response.statusCode == 200) {
        return NetworkSuccessResponse(
            data: DiscoverMoviesModel.fromJson(response.data));
      } else {
        return NetworkErrorResponse(error: response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return catchError(e);
    }
  }

  // get popular movies
  Future<NetworkResponse> getUpcomingMovies() async {
    try {
      return await createRequest()
          .get(DiscoverUrl.upcomingMovies)
          .then((Response response) {
        if (response.statusCode == 200) {
          return NetworkSuccessResponse(
              data: UpcomingMoviesModel.fromJson(response.data));
        } else {
          return NetworkErrorResponse(error: response.statusMessage.toString());
        }
      });
    } on DioException catch (e) {
      return catchError(e);
    }
  }

  Future getTopMovies() async {
    try {
      return await createRequest()
          .get(DiscoverUrl.topRatedMovies)
          .then((Response response) {
        if (response.statusCode == 200) {
          return NetworkSuccessResponse(data: DiscoverMoviesModel.fromJson(response.data));
        } else {
          return NetworkErrorResponse(error: response.statusMessage.toString());
        }
      });
    } on DioException catch (e) {
      return catchError(e);
    }
  }
}

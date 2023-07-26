import 'package:dio/dio.dart';
import 'package:tmdb/core/config/dio_catch_error.dart';
import 'package:tmdb/core/config/dio_config.dart';
import 'package:tmdb/core/config/network_config.dart';
import 'package:tmdb/core/constants/genres/movie_genres_url.dart';
import 'package:tmdb/model/genres_model.dart';

class GenresService with DioConfig, DioCatchException {
  Future<NetworkResponse> getGenres() async {
    try {
      return await createRequest()
          .get(GenresUrl.genresList)
          .then((Response response) {
        if (response.statusCode == 200) {
          return NetworkSuccessResponse(
              data: GenresModel.fromJson(response.data));
        } else {
          return NetworkErrorResponse(error: response.statusMessage.toString());
        }
      });
    } on DioException catch (e) {
      return catchError(e);
    }
  }
}

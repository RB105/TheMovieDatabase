import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb/core/config/dio_catch_error.dart';
import 'package:tmdb/core/config/dio_config.dart';
import 'package:tmdb/core/config/network_config.dart';
import 'package:tmdb/core/constants/discover/movie_list_url.dart';
import 'package:tmdb/model/discover_movies_model.dart';

class DiscoverService with DioConfig, DioCatchException {
  Future<NetworkResponse> getMovies() async {
    final bearerToken = dotenv.get('ACCESS_TOKEN');
    try {
      Response response = await createRequest().get(DiscoverUrl.movie,
          options: Options(headers: {
            "Authorization": "Bearer $bearerToken",
          }));
      if (response.statusCode == 200) {
        print(response.data);
        return NetworkSuccessResponse(
            data: DiscoverMoviesModel.fromJson(response.data));
      } else {
        return NetworkErrorResponse(error: response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return catchError(e);
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/core/config/network_config.dart';
import 'package:tmdb/model/discover_movies_model.dart';
import 'package:tmdb/model/genres_model.dart';
import 'package:tmdb/model/upcoming_movies_model.dart';
import 'package:tmdb/service/discover/movies_list_service.dart';
import 'package:tmdb/service/genres/movie_genres_service.dart';

part 'home_cubit.dart';

abstract class HomeStates {
  HomeStates();
}

class HomeInitState extends HomeStates {
  HomeInitState();
}

class HomeLoadingState extends HomeStates {
  HomeLoadingState();
}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState({required this.error});
}

class HomeSuccessState extends HomeStates {
  GenresModel genres;
  DiscoverMoviesModel movies;
  UpcomingMoviesModel upcomingMovies;
  DiscoverMoviesModel topMovies;
  HomeSuccessState(
      {required this.movies,
      required this.genres,
      required this.upcomingMovies,required this.topMovies});
}

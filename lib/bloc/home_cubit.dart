part of 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState()) {
    getMovies();
  }

  DiscoverService discoverService = DiscoverService();
  GenresService genresService = GenresService();

  Future<void> getMovies() async {
    emit(HomeLoadingState());

    NetworkResponse discoverMovies = await discoverService.getAllMovies();
    NetworkResponse genres = await genresService.getGenres();
    NetworkResponse upcomingMovies = await discoverService.getUpcomingMovies();
    NetworkResponse topMovies = await discoverService.getTopMovies();

    // success
    if (discoverMovies is NetworkSuccessResponse &&
        genres is NetworkSuccessResponse &&
        upcomingMovies is NetworkSuccessResponse && topMovies is NetworkSuccessResponse) {
      emit(HomeSuccessState(
          movies: discoverMovies.data,
          genres: genres.data,
          upcomingMovies: upcomingMovies.data,
          topMovies: topMovies.data
          ));
    }
    // exception
    else if (discoverMovies is NetworkExceptionResponse ||
        genres is NetworkExceptionResponse ||
        upcomingMovies is NetworkExceptionResponse || topMovies is NetworkExceptionResponse) {
      if (discoverMovies is NetworkExceptionResponse) {
        emit(HomeErrorState(error: discoverMovies.exception));
      } else if (genres is NetworkExceptionResponse) {
        emit(HomeErrorState(error: genres.exception));
      } else if (upcomingMovies is NetworkExceptionResponse) {
        emit(HomeErrorState(error: upcomingMovies.exception));
      }
      else if (topMovies is NetworkExceptionResponse) {
        emit(HomeErrorState(error: topMovies.exception));
      }
    }
    // network error
    else if (discoverMovies is NetworkErrorResponse ||
        genres is NetworkErrorResponse) {
      if (discoverMovies is NetworkErrorResponse) {
        emit(HomeErrorState(error: discoverMovies.error));
      } else if (genres is NetworkErrorResponse) {
        emit(HomeErrorState(error: genres.error));
      }
    }
  }
}

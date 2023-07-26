part of 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState()) {
    getMovies();
  }

  DiscoverService discoverService = DiscoverService();
  GenresService genresService = GenresService();

  Future<void> getMovies() async {
    emit(HomeLoadingState());

    NetworkResponse discoverMovies = await discoverService.getMovies();
    NetworkResponse genres = await genresService.getGenres();

    // success
    if (discoverMovies is NetworkSuccessResponse &&
        genres is NetworkSuccessResponse) {
          
      emit(HomeSuccessState(movies: discoverMovies.data, genres: genres.data));
    }
    // exception
    else if (discoverMovies is NetworkExceptionResponse ||
        genres is NetworkExceptionResponse) {
      if (discoverMovies is NetworkExceptionResponse) {
        emit(HomeErrorState(error: discoverMovies.exception));
      } else if (genres is NetworkExceptionResponse) {
        emit(HomeErrorState(error: genres.exception));
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

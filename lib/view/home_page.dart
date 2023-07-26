import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/home_states.dart';
import 'package:tmdb/core/extensions/build_context_ext.dart';
import 'package:tmdb/core/extensions/date_ext.dart';
import 'package:tmdb/core/theme/dark_mode.dart';
import 'package:tmdb/core/widgets/home_loading_wid.dart';
import 'package:tmdb/model/genres_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentMovie = 0;
  List<String> genres = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, HomeStates state) {
        if (state is HomeSuccessState) {
          genres = checkGenres(
              state.genres.genres, state.movies.results[currentMovie].genreIds);
          setState(() {});
        }
      },
      builder: (BuildContext context, HomeStates state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Text("Movies"),
            ),
            body: Builder(
              builder: (context) {
                if (state is HomeLoadingState) {
                  return const HomeLoadingWidget();
                } else if (state is HomeErrorState) {
                  return Center(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: context.read<HomeCubit>().getMovies,
                      child: SizedBox(
                        height: context.height * 0.1,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(state.error),
                            const Icon(Icons.refresh)
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (state is HomeSuccessState) {
                  return FadeIn(
                    duration: const Duration(seconds: 2),
                    child: RefreshIndicator.adaptive(
                      onRefresh: context.read<HomeCubit>().getMovies,
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: context.height * 0.01),
                            child: SizedBox(
                              height: context.height * 0.5,
                              width: double.infinity,
                              child: PageView.builder(
                                onPageChanged: (value) {
                                  currentMovie = value;
                                  genres = checkGenres(
                                      state.genres.genres,
                                      state.movies.results[currentMovie]
                                          .genreIds);
                                  setState(() {});
                                },
                                itemCount: state.movies.results.length,
                                itemBuilder: (context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.width * 0.05),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w600_and_h900_bestv2${state.movies.results[index].posterPath}"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: context.height * 0.01),
                            child: SizedBox(
                              width: double.infinity,
                              height: context.height * 0.35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: context.width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)
                                      ,border: Border.all(
                                        color: Colors.white10
                                      )
                                    ),
                                    child: ListView.builder(
                                      itemCount: genres.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                              genres[index],
                                              style: DarkMode.primaryStyle,
                                            ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.width * 0.4,
                                    child: Column(
                                      children: [
                                        ListTile(title: Text(state.movies.results[currentMovie].title.toString(),style: DarkMode.primaryStyle),),
                                        ListTile(title: Text("Date : ${state.movies.results[currentMovie].releaseDate.toString().toDate()}",style: DarkMode.primaryStyle),),
                                        ListTile(title: Text("Rate : 🌟${state.movies.results[currentMovie].voteAverage}",style: DarkMode.primaryStyle),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ));
      },
    );
  }

  // checking appropirate genre
  List<String> checkGenres(List<Genre> genres, List<int> genreIds) {
    List<String> result = [];
    for (int i = 0; i < genreIds.length; i++) {
      for (int j = 0; j < genres.length; j++) {
        if (genreIds[i] == genres[j].id) {
          result.add(genres[j].name);
        }
      }
    }
    return result;
  }
}

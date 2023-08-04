import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/home_states.dart';
import 'package:tmdb/core/extensions/build_context_ext.dart';
import 'package:tmdb/core/extensions/date_ext.dart';
import 'package:tmdb/core/theme/dark_mode.dart';
import 'package:tmdb/view/home/home_page.dart';

class UpcomingMoviesPage extends StatefulWidget {
  final HomeSuccessState state;
  const UpcomingMoviesPage({super.key, required this.state});

  @override
  State<UpcomingMoviesPage> createState() => _UpcomingMoviesPageState();
}

class _UpcomingMoviesPageState extends State<UpcomingMoviesPage> {
  List<String> genres = [];
  int currentMovie = 0;
  @override
  void initState() {
    setState(() {
      genres = checkGenres(widget.state.genres.genres,
          widget.state.upcomingMovies.results![currentMovie].genreIds!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: RefreshIndicator.adaptive(
        onRefresh: context.read<HomeCubit>().getMovies,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
              child: SizedBox(
                height: context.height * 0.6,
                width: double.infinity,
                child: PageView.builder(
                  
                  onPageChanged: (value) {
                    currentMovie = value;
                    genres = checkGenres(
                        widget.state.genres.genres,
                        widget.state.upcomingMovies.results![currentMovie]
                            .genreIds!);
                    setState(() {});
                  },
                  itemCount: widget.state.upcomingMovies.results!.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.05),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.state.upcomingMovies.results![index].posterPath}"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.01),
              child: SizedBox(
                width: double.infinity,
                height: context.height * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: context.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white10)),
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
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text(
                                widget.state.upcomingMovies
                                    .results![currentMovie].title
                                    .toString(),
                                style: DarkMode.primaryStyle),
                          ),
                          ListTile(
                            title: Text(
                                "Date : ${widget.state.upcomingMovies.results![currentMovie].releaseDate.toString().toDate()}",
                                style: DarkMode.primaryStyle),
                          ),
                          ListTile(
                            title: Text(
                                "Rate : 🌟${widget.state.upcomingMovies.results![currentMovie].voteAverage}",
                                style: DarkMode.primaryStyle),
                          )
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
  }
}

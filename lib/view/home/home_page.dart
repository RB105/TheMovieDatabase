import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/home_states.dart';
import 'package:tmdb/core/extensions/build_context_ext.dart';
import 'package:tmdb/core/theme/dark_mode.dart';
import 'package:tmdb/core/widgets/home_loading_wid.dart';
import 'package:tmdb/model/genres_model.dart';
import 'package:tmdb/view/home/all_mov_list_page.dart';
import 'package:tmdb/view/home/upcoming_mov_list_page.dart';
import 'package:tmdb/view/home/top_mov_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, HomeStates state) {},
      builder: (BuildContext context, HomeStates state) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text(
                  "TMDB",
                  style: DarkMode.titleStyle,
                ),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(context.height * 0.025),
                    child: TabBar(
                        isScrollable: true,
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: "All",
                          ),
                          Tab(
                            text: "Upcoming",
                          ),
                          Tab(
                            text: "Top",
                          )
                        ]))),
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
                  return TabBarView(
                      controller: tabController,
                      children: <Widget>[
                        AllMoviesPage(state: state),
                        UpcomingMoviesPage(state: state),
                        TopMoivesPage(state: state)
                      ]);
                } else {
                  return const SizedBox();
                }
              },
            ));
      },
    );
  }
}

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

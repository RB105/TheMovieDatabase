import 'package:flutter/material.dart';
import 'package:tmdb/core/config/network_config.dart';
import 'package:tmdb/model/discover_movies_model.dart';
import 'package:tmdb/service/discover/movies_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: FutureBuilder(
        future: DiscoverService().getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot is NetworkExceptionResponse) {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          } else {
            print(snapshot.data);
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(""),
                );
              },
            );
          }
        },
      ),
    );
  }
}

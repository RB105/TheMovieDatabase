import 'package:flutter/material.dart';
import 'package:tmdb/view/home/home_page.dart';
import 'package:tmdb/view/search/search_movies_page.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  final List<Widget> _pages = [const HomePage(), const SearchMoviesPage()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      
      bottomNavigationBar:
          BottomNavigationBar(
            elevation: 0.0,
            selectedItemColor: Colors.white70,
            unselectedItemColor: Colors.white24,
            backgroundColor: Colors.transparent,
            onTap: onTap,
            currentIndex: currentIndex, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "")
      ]),
    );
  }

  void onTap(int value) {
    setState(() => currentIndex = value);
  }
}

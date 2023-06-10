import 'package:cowlar_test/pages/movie_info_page.dart';
import 'package:cowlar_test/pages/search_page.dart';
import 'package:cowlar_test/pages/search_results_page.dart';
import 'package:cowlar_test/pages/watch_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const App(),
      // initialRoute: "/watch",
      routes: {
        "/movie_info": (context) => const MovieInfoPage(movie: null),
        "/watch": (context) => const HomePage(),
        "/search": (context) => const SearchPage(),
        "/search_result": (context) => const SearchResultsPage()
      },
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,


      // App-Bar
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Watch"),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        actions:  <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/search");
            },
            icon: const Icon(Icons.search),
          ),

        ],
      ),

      // HomePage
      body: HomePage(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
        color: const Color.fromRGBO(46, 39, 57, 1),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(46, 39, 57, 1),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          type: BottomNavigationBarType.fixed,

          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,

          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
            opacity: 1,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            opacity: 1,
          ),

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_rounded), label: "Watch"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books_rounded), label: "Library"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_vert_rounded), label: "More"),
          ],
        ),
      ),
    );
  }
}

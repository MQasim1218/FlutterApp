import 'dart:convert';

import 'package:cowlar_test/components/movie_card.dart';
import 'package:cowlar_test/data/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Movie>> fetchMovies() async {
    List<Movie> movies = List.empty(growable: true);
    // List<Movie> movies = List.(growable: true);

    http.Response result;
    result = await http.get(
      Uri.parse("https://api.themoviedb.org/3/movie/upcoming"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzA4MGMxMmQ0MDYxMjgxODY4NTdmNzZjNmFmZmI2NSIsInN1YiI6IjY0ODM2MmJkZDJiMjA5MDBjYTFlN2Q4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.V6h7AKk8D_AnW2E39j9iekdPONxYWjppF_HmgjyUvfQ",
      },
    );

    if (result.statusCode == 200) {
      // print(result.body);
      var fin = json.decode(result.body);

      // How about we convert the result to an array of Movie objects right here and return that?

      for (var data in fin["results"]) {
        // if (data["video"] == true) {
        String trailer_url = "empty";
        // Now time to get the trailer url!
        http.Response res;
        res = await http.get(
            Uri.parse(
                'https://api.themoviedb.org/3/movie/${data['id']}/videos'),
            headers: {
              "Authorization":
                  "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzA4MGMxMmQ0MDYxMjgxODY4NTdmNzZjNmFmZmI2NSIsInN1YiI6IjY0ODM2MmJkZDJiMjA5MDBjYTFlN2Q4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.V6h7AKk8D_AnW2E39j9iekdPONxYWjppF_HmgjyUvfQ",
            });
        if (res.statusCode == 200) {
          var finVids = json.decode(res.body);

          if (finVids['results'] != null && finVids['results'].isNotEmpty) {
            trailer_url =
            'https://www.youtube.com/watch?v=${finVids['results'][0]['key']}';
          } else {
            trailer_url = 'empty';
          }
        }

        Movie movie = Movie(
            name: data["original_title"],
            img_url: "https://image.tmdb.org/t/p/w500${data["poster_path"]}",
            date: data["release_date"],
            genre_tags: List<int>.from(data["genre_ids"]),
            // Need to resolve these!
            overview: data["overview"],
            trailer_url: trailer_url
        );

        movies.add(movie);
        // }
      }

      if (kDebugMode) {
        print("The Last Movie vid url is: ${movies.last.trailer_url}");
      }

      return movies;
    }

    return List.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        return FutureBuilder(
          future: fetchMovies(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error}");

              return Center(
                child: Text("Error Fetching data! Err:${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  // ignore: prefer_interpolation_to_compose_strings
                  // print("The data retrieved is: \n" + snapshot.data[index]["title"]);
                  Movie movie = snapshot.data[index];

                  // print(snapshot.data[index]);

                  // Movie movie = snapshot.data[index];
                  return MovieCard(movie: movie);
                },
              );
            } else {
              return const Text("Loading");
            }
          },
          // child:
        );
      },
    );
  }
}

// viewportBuilder: (BuildContext context, ViewportOffset position) {
//   return FutureBuilder(
//     future: fetchMovies(),
//     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//       if (snapshot.hasError) {
//         return Center(
//           child: Text("Error Fetching data! Err:${snapshot.error}"),
//         );
//       } else if (snapshot.hasData) {
//         return ListView.builder(
//           itemCount: snapshot.data.length,
//           itemBuilder: (context, index) {
//             // ignore: prefer_interpolation_to_compose_strings
//             // print("The data retrieved is: \n" + snapshot.data[index]["title"]);
//             Movie movie = snapshot.data[index];
//
//             // print(snapshot.data[index]);
//
//             // Movie movie = snapshot.data[index];
//             return MovieCard(movie: movie);
//           },
//         );
//       } else {
//         return const Text("Loading");
//       }
//     },
//     // child:
//   );
// },

import 'package:cowlar_test/data/movie.dart';
import 'package:cowlar_test/pages/movie_info_page.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        height: 250,
        width: 450,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MovieInfoPage(movie: movie);
            }));

            //  We can also do it with the simpler Push Named method!
            // Navigator.pushNamed(context, "/movie_info", arguments: {
            //   movie: movie
            // });
          },
          child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 5.0,
              child: Stack(
                // alignment: const Alignment(0, 0),
                children: [
                  // Image card
                  Image.network(
                    movie.img_url,
                    fit: BoxFit.cover,
                    width: 450.0,
                    height: 250.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        movie.name,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 28.0,
                            color: Colors.white),
                      ),
                    ),
                  ),

                  // The overlay text!
                ],
              )),
        ));
  }
}

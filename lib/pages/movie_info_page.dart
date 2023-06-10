import 'package:cowlar_test/CustomWidgets/OrientationWidgets.dart';
import 'package:cowlar_test/data/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieInfoPage extends StatefulWidget {
  final Movie? movie;

  const MovieInfoPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieInfoPage> createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends State<MovieInfoPage> {
  @override
  Widget build(BuildContext context) {
    return OrientationWidget(
        portrait: PortraitContent(movie: widget.movie),
        landscape: LandscapeContent(movie: widget.movie));
  }
}

class PortraitContent extends StatelessWidget {
  final Movie? movie;

  const PortraitContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text("The Movie info page"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // This Column will hold the above information
          Expanded(
            flex: 6,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(movie?.img_url ?? '', fit: BoxFit.cover),
                Container(
                  alignment: Alignment.bottomCenter,
                  // color: Colors.green,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "In Theatres ${movie?.date}!",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),

                      const SizedBox(height: 10),

                      // The get tickets button!
                      TextButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print("Do nothing");
                          }
                        },
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(243, 50)),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromRGBO(97, 195, 242, 1)),
                            elevation: const MaterialStatePropertyAll(0.0),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                        child: const Center(
                            child: Text("Get Tickets",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.6))),
                      ),

                      const SizedBox(height: 10),

                      // Watch trailer button
                      TextButton(
                        onPressed: () {
                          launchUrl(
                              // widget.movie?.trailer_url ?? "no-uri"
                              Uri.parse(movie?.trailer_url ?? "no-uri"),
                              // mode: LaunchMode.inAppWebView,
                              mode: LaunchMode.inAppWebView);
                        },
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(243, 50)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),

                            // const MaterialStatePropertyAll(
                            //     Color.fromRGBO(97, 195, 242, 1)),
                            elevation: const MaterialStatePropertyAll(0.0),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Color.fromRGBO(97, 195, 242, 1),
                                        width: 2)))),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow, color: Colors.white),
                              Text(
                                "Watch Trailer!",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.6),
                              )
                            ]),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                )
              ],
            ),
          ),

          // This Column will hold the information below

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Genres",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      )),
                  const SizedBox(),
                  // Row holding all the values for genres!
                  Row(
                    children: movie?.genre_tags
                            .map((tag) => Container(
                                  // color: CupertinoColors.activeGreen,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CupertinoColors.activeGreen),
                                  child: Text(
                                    "$tag",
                                    style: const TextStyle(
                                      height: 1.25,
                                      letterSpacing: 1.6,

                                      // backgroundColor: Colors.greenAccent,

                                      // color: Colors.greenAccent
                                    ),
                                  ),
                                ))
                            .toList() ??
                        [],
                  ),

                  // Middle space between the overview and the Genres
                  const SizedBox(height: 18),

                  // The Overview Section.
                  const Text("Overview",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      )),
                  Text(
                    '${movie?.overview.substring(0, 300)} ...',
                    style: const TextStyle(color: Colors.blueGrey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}

class LandscapeContent extends StatelessWidget {
  final Movie? movie;

  const LandscapeContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text("The Movie info page"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // This Column will hold the above information
          Expanded(
            flex: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(movie?.img_url ?? '', fit: BoxFit.cover),
                Container(
                  alignment: Alignment.bottomCenter,
                  // color: Colors.green,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "In Theatres ${movie?.date}!",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),

                      const SizedBox(height: 10),

                      // The get tickets button!
                      TextButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print("Do nothing");
                          }
                        },
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(243, 50)),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromRGBO(97, 195, 242, 1)),
                            elevation: const MaterialStatePropertyAll(0.0),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                        child: const Center(
                            child: Text("Get Tickets",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.6))),
                      ),

                      const SizedBox(height: 10),

                      // Watch trailer button
                      TextButton(
                        onPressed: () {
                          launchUrl(
                              // widget.movie?.trailer_url ?? "no-uri"
                              Uri.parse(movie?.trailer_url ?? "no-uri"),
                              // mode: LaunchMode.inAppWebView,
                              mode: LaunchMode.inAppWebView);
                        },
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(243, 50)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),

                            // const MaterialStatePropertyAll(
                            //     Color.fromRGBO(97, 195, 242, 1)),
                            elevation: const MaterialStatePropertyAll(0.0),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Color.fromRGBO(97, 195, 242, 1),
                                        width: 2)))),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow, color: Colors.white),
                              Text(
                                "Watch Trailer!",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.6),
                              )
                            ]),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                )
              ],
            ),
          ),

          // This Column will hold the information below

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Genres",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      )),
                  const SizedBox(),
                  // Row holding all the values for genres!
                  Row(
                    children: movie?.genre_tags
                            .map((tag) => Container(
                                  // color: CupertinoColors.activeGreen,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CupertinoColors.activeGreen),
                                  child: Text(
                                    "$tag",
                                    style: const TextStyle(
                                      height: 1.25,
                                      letterSpacing: 1.6,

                                      // backgroundColor: Colors.greenAccent,

                                      // color: Colors.greenAccent
                                    ),
                                  ),
                                ))
                            .toList() ??
                        [],
                  ),

                  // Middle space between the overview and the Genres
                  const SizedBox(height: 18),

                  // The Overview Section.
                  const Text("Overview",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      )),
                  Text(
                      '${movie?.overview.substring(0, 300)} ...',
                      style: const TextStyle(color: Colors.blueGrey))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

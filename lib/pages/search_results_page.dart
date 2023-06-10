import 'package:flutter/material.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Search Results Page"),
          ),

          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: const Text("The Home Page"),
          ),
        )
    );
  }
}

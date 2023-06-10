import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("The Search Page"),
          ),

          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: const Text("The Home Page"),
          ),
        )
    );
  }
}

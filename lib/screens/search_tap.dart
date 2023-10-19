import 'package:flutter/material.dart';
import 'package:movie_app/sections/search_section.dart';

import '../models/PopularResponse.dart';
import '../shared/network/remote/Api_manager.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String moviename = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    moviename = value;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search for movies...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            FutureBuilder(
                future: ApiManager.getKeyword(keyword: moviename),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text("something error"),
                        TextButton(onPressed: () {}, child: Text("try again"))
                      ],
                    );
                  }
                  List<Results> results = snapshot.data?.results ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        return SearchSection(result: results[index]);
                      },
                    ),
                  );
                })
          ],
        ));
  }
}
// import 'package:flutter/cupertino.dart';
//
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

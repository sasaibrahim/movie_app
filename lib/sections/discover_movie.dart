import 'package:flutter/material.dart';
import 'package:movie_app/models/CategoryResponse.dart';

import '../models/DiscoverResponse.dart';
import '../models/TopRatedResponse.dart';
import '../shared/network/remote/Api_manager.dart';
import 'movie_category.dart';

class DiscoverMovie extends StatefulWidget {
  static const String routeName = 'discover';

  @override
  State<DiscoverMovie> createState() => _DiscoverMovieState();
}

class _DiscoverMovieState extends State<DiscoverMovie> {
  @override
  Widget build(BuildContext context) {
    var genres = ModalRoute.of(context)!.settings.arguments as Genres;

    return FutureBuilder<DiscoverResponse>(
        future: ApiManager.getDiscover(genres.id!.toInt()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                Text("something error"),
                TextButton(onPressed: () {}, child: Text("try again"))
              ],
            );
          }
          List<Results> topresults = snapshot.data?.results ?? [];

          return Expanded(
            flex: 1,
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: topresults.length,
              itemBuilder: (context, index) {
                return MovieCat(
                  movresult: topresults[index],
                );
              },
            ),
          );
        });
  }
}

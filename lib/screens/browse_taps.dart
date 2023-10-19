import 'package:flutter/material.dart';
import 'package:movie_app/sections/discover_movie.dart';
import 'package:movie_app/sections/movie_item.dart';

import '../models/CategoryResponse.dart';
import '../shared/network/remote/Api_manager.dart';

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CategoryResponse>(
        future: ApiManager.getGenere(),
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
          List<Genres> genres = snapshot.data?.genres ?? [];
          return GridView.builder(
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 100),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(DiscoverMovie.routeName,
                        arguments: genres[index]);
                  },
                  child: MovieItem(genres[index]));
            },
          );
        });
  }
}

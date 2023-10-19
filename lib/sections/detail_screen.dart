import 'package:flutter/material.dart';
import 'package:movie_app/models/PopularResponse.dart';
import 'package:movie_app/sections/similar_screen.dart';

import '../models/SimilarResponse.dart';
import '../shared/network/remote/Api_manager.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = 'detail';

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)!.settings.arguments as Results;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${result.backdropPath}",
                    fit: BoxFit.fill,
                    height: 220,
                    width: 380,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      result.title ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      result.releaseDate ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Stack(children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w500${result.backdropPath}",
                        fit: BoxFit.fill,
                        height: 140,
                        width: 130,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      )
                    ]),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            result.overview ?? '',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            result.voteAverage.toString(),
                            style: TextStyle(color: Colors.yellow, fontSize: 8),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'More Like This',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            child: FutureBuilder<SimilarResponse>(
                future: ApiManager.getSimilar(),
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
                  List<ResultsSim> simresults = snapshot.data?.results ?? [];
                  return Expanded(
                    flex: 1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: simresults.length,
                      itemBuilder: (context, index) {
                        return SimilarScreen(
                          newresult: simresults[index],
                        );
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/models/PopularResponse.dart';
import 'package:movie_app/sections/detail_screen.dart';

class PopularScreen extends StatelessWidget {
  Results result;

  PopularScreen({required this.result});

  static const String routeName = 'popul';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(DetailScreen.routeName, arguments: result),
          child: Card(
            // color: Colors.white10,
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
        ),
        Text(
          result.title ?? '',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Text(
              result.releaseDate ?? '',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            SizedBox(
              width: 40,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 20,
            ),
            Text(
              result.voteAverage.toString(),
              style: TextStyle(color: Colors.yellow, fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}

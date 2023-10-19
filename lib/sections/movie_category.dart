import 'package:flutter/material.dart';

import '../models/DiscoverResponse.dart';

class MovieCat extends StatelessWidget {
  Results movresult;

  MovieCat({required this.movresult});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius: 100,
                    color: Colors.white.withOpacity(0.3),
                    spreadRadius: 25,
                    offset: Offset(1, 1))
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${movresult.backdropPath}",
              fit: BoxFit.fill,
              height: 300,
              width: 300,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          movresult.title ?? '',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          movresult.releaseDate ?? '',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        Divider(
          thickness: 4,
          color: Colors.white,
        ),
      ],
    );
  }
}

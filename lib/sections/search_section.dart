import 'package:flutter/material.dart';

import '../models/PopularResponse.dart';
import 'detail_screen.dart';

class SearchSection extends StatelessWidget {
  Results result;

  SearchSection({required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(DetailScreen.routeName, arguments: result),
          child: Container(
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
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          result.releaseDate ?? '',
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
        SizedBox(
          height: 3,
        ),
        Divider(
          thickness: 4,
          color: Colors.black,
        ),
      ],
    );
  }
}

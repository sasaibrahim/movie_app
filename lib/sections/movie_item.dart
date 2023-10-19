import 'package:flutter/material.dart';
import 'package:movie_app/models/CategoryResponse.dart';

class MovieItem extends StatelessWidget {
  Genres genres;

  MovieItem(this.genres);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                  blurRadius: 100,
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 25,
                  offset: Offset(1, 1))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/images/cat.png",
            fit: BoxFit.fill,
            height: 310,
            width: 280,
          ),
        ),
      ),
      Text(
        genres.name ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )
    ]);
  }
}

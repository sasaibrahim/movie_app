import 'package:flutter/material.dart';
import 'package:movie_app/models/NewResult.dart';

class NewResultScreen extends StatefulWidget {
  Resultses newresult;

  NewResultScreen({required this.newresult});

  @override
  State<NewResultScreen> createState() => _NewResultScreenState();
}

class _NewResultScreenState extends State<NewResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${widget.newresult.posterPath}",
              fit: BoxFit.fill,
              height: 140,
              width: 140,
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20,
          )
        ]),
      ],
    );
  }
}

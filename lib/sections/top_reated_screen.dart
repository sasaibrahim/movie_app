import 'package:flutter/material.dart';

import '../models/TopRatedResponse.dart';

class TopReatedScreen extends StatefulWidget {
  Resultees topresult;

  TopReatedScreen({required this.topresult});

  @override
  State<TopReatedScreen> createState() => _TopReatedScreenState();
}

class _TopReatedScreenState extends State<TopReatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${widget.topresult.posterPath}",
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

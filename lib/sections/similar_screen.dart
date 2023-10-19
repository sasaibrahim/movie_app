import 'package:flutter/material.dart';

import '../models/SimilarResponse.dart';

class SimilarScreen extends StatefulWidget {
  ResultsSim newresult;

  SimilarScreen({required this.newresult});

  @override
  State<SimilarScreen> createState() => _SimilarScreenState();
}

class _SimilarScreenState extends State<SimilarScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${widget.newresult.posterPath}",
                    fit: BoxFit.fill,
                    height: 190,
                    width: 110,
                  ),
                ),
                Text(
                  widget.newresult.title ?? '',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 6,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.newresult.releaseDate ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 3),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 30,
          )
        ]),
      ],
    );
  }
}

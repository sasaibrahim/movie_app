import 'package:flutter/material.dart';
import 'package:movie_app/models/NewResult.dart';
import 'package:movie_app/models/PopularResponse.dart';
import 'package:movie_app/sections/new_result_screen.dart';
import 'package:movie_app/sections/popular_screen.dart';
import 'package:movie_app/sections/top_reated_screen.dart';

import '../models/TopRatedResponse.dart';
import '../shared/network/remote/Api_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white10,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FutureBuilder(
              future: ApiManager.getPopular(),
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
                List<Results> results = snapshot.data?.results ?? [];

                return Expanded(
                  flex: 2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return PopularScreen(result: results[index]);
                    },
                  ),
                );
              }),
          SizedBox(
            height: 4,
          ),
          Text(
            'Upcoming',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          FutureBuilder<NewResult>(
              future: ApiManager.getResult(),
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
                List<Resultses> newresults = snapshot.data?.results ?? [];

                return Expanded(
                  flex: 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newresults.length,
                    itemBuilder: (context, index) {
                      return NewResultScreen(newresult: newresults[index]);
                    },
                  ),
                );
              }),
          Text(
            'Recommended',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          FutureBuilder<TopRatedResponse>(
              future: ApiManager.getTopRated(),
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
                List<Resultees> topresults = snapshot.data?.results ?? [];

                return Expanded(
                  flex: 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topresults.length,
                    itemBuilder: (context, index) {
                      return TopReatedScreen(
                        topresult: topresults[index],
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}

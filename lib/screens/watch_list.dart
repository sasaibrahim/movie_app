//  import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/shared/network/firebase/firebase_function.dart';
//
// import '../models/DiscoverResponse.dart';
// import '../models/Watch_Result.dart';
// import '../sections/detail_watchlist.dart';
// import '../sections/popular_screen.dart';
// import '../shared/network/remote/Api_manager.dart';
// //
// // import '../models/TopRatedResponse.dart';
// // import '../sections/top_reated_screen.dart';
// // import '../shared/network/remote/Api_manager.dart';
// //
// class WatchScreen extends StatefulWidget {
//   @override
//    _WatchScreenState createState() => _WatchScreenState();
//  }
//  class _WatchScreenState extends State<WatchScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//      return FutureBuilder(
//          future: FireBaseFunctions,
//          builder: (context,snapshot){
//            if (snapshot.connectionState == ConnectionState.waiting) {
//              return Center(child: CircularProgressIndicator());
//            }
//            if (snapshot.hasError) {
//              return Column(
//                children: [
//                  Text("something error"),
//                  TextButton(onPressed: () {}, child: Text("try again"))
//                ],
//              );
//            }
//            List<Results>results=snapshot.data?.results??[];
//
//            return Expanded(
//              flex: 2,
//              child: ListView.builder(
//                scrollDirection: Axis.horizontal,
//                itemCount: results.length,
//                itemBuilder: (context,index){
//
//                  return PopularScreen(result: results[index]);
//                },
//              ),
//            );
//          });
//
//
//   }
//  }
// //

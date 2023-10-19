// import 'package:flutter/material.dart';
// import 'package:movie_app/screens/popular_screen.dart';
//
// import '../models/PopularResponse.dart';
// import '../shared/network/remote/Api_manager.dart';
//
// class SearchIcon extends SearchDelegate{
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return[
//       IconButton(onPressed: (){},
//           icon: Icon(Icons.search,
//           size: 30,))
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return  IconButton(onPressed: (){},
//         icon: Icon(Icons.search,
//           size: 30,));
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return  FutureBuilder(
//         future: ApiManager.getKeyword(keyword:query),
//         builder: (context,snapshot){
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Column(
//               children: [
//                 Text("something error"),
//                 TextButton(onPressed: () {}, child: Text("try again"))
//               ],
//             );
//           }
//           List<Results>results=snapshot.data?.results??[];
//
//           return Expanded(
//             flex: 2,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: results.length,
//               itemBuilder: (context,index){
//
//                 return PopularScreen(result: results[index]);
//               },
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     return  FutureBuilder(
//         future: ApiManager.getKeyword(keyword:query),
//         builder: (context,snapshot){
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Column(
//               children: [
//                 Text("something error"),
//                 TextButton(onPressed: () {}, child: Text("try again"))
//               ],
//             );
//           }
//           List<Results>results=snapshot.data?.results??[];
//
//           return Expanded(
//             flex: 2,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: results.length,
//               itemBuilder: (context,index){
//
//                 return PopularScreen(result: results[index]);
//               },
//             ),
//           );
//         });
//   }
//
// }

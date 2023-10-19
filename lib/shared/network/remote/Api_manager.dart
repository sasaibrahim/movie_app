import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../models/CategoryResponse.dart';
import '../../../models/DiscoverResponse.dart';
import '../../../models/NewResult.dart';
import '../../../models/PopularResponse.dart';
import '../../../models/SimilarResponse.dart';
import '../../../models/TopRatedResponse.dart';

class ApiManager {
  static Future<PopularResponse> getPopular() async {
    Uri URL = Uri.https("api.themoviedb.org", "/3/movie/popular", {
      "api_key": "f5b04fb5b67a1f52e6937536fb47bae7",
    });
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    PopularResponse popularResponse = PopularResponse.fromJson(jsonResponse);
    return popularResponse;
  }

  static Future<NewResult> getResult() async {
    Uri URL = Uri.https("api.themoviedb.org", "/3/movie/upcoming", {
      "api_key": "f5b04fb5b67a1f52e6937536fb47bae7",
    });
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    NewResult newResult = NewResult.fromJson(jsonResponse);
    return newResult;
  }

  static Future<TopRatedResponse> getTopRated() async {
    Uri URL = Uri.https("api.themoviedb.org", "3/movie/top_rated", {
      "api_key": "f5b04fb5b67a1f52e6937536fb47bae7",
    });
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    TopRatedResponse topRated = TopRatedResponse.fromJson(jsonResponse);
    return topRated;
  }

  static Future<SimilarResponse> getSimilar() async {
    Uri URL = Uri.https("api.themoviedb.org", "3/movie/238/similar", {
      "api_key": "f5b04fb5b67a1f52e6937536fb47bae7",
    });
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    SimilarResponse similarResponse = SimilarResponse.fromJson(jsonResponse);
    return similarResponse;
  }

  static Future<PopularResponse> getKeyword({required String keyword}) async {
    Uri URL = Uri.https("api.themoviedb.org", "3/search/movie",
        {"api_key": "f5b04fb5b67a1f52e6937536fb47bae7", "query": keyword});
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    PopularResponse popularResponse = PopularResponse.fromJson(jsonResponse);
    return popularResponse;
  }

  static Future<CategoryResponse> getGenere() async {
    Uri URL = Uri.https("api.themoviedb.org", "3/genre/movie/list", {
      "api_key": "f5b04fb5b67a1f52e6937536fb47bae7",
    });
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    CategoryResponse categoryResponse = CategoryResponse.fromJson(jsonResponse);
    return categoryResponse;
  }

  static Future<DiscoverResponse> getDiscover(int genreId) async {
    Uri URL = Uri.https("api.themoviedb.org", "3/discover/movie", {
      "api_key": "f5b04fb5b67a1f52e6937536fb47bae7",
      "with_genres": "$genreId"
    });
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    DiscoverResponse discoverResponse = DiscoverResponse.fromJson(jsonResponse);
    return discoverResponse;
  }
}

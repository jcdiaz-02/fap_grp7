import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fap_grp7/models/themovieDB/the_movie_db.dart';

const apiKey= '42e8cb86b4f3b37110bb30308d5f7ad5';
const theMovieDBMovieTrending= 'https://api.themoviedb.org/3/trending/movie/';

class TheMovieDBModel {
  Trending? trendingData;

  Future<dynamic>? getTrendingMoviesWeek() async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBMovieTrending/week?api_key=$apiKey'));
    if (response.statusCode == 200) {
      trendingData = Trending.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Trending This Week');
    }

    return trendingData;
  }

  Future<dynamic>? getTrendingMoviesDay() async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBMovieTrending/day?api_key=$apiKey'));
    if (response.statusCode == 200) {
      trendingData = Trending.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Trending This Week');
    }

    return trendingData;
  }

}
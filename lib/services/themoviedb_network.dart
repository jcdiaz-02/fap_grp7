import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fap_grp7/models/themovieDB/the_movie_db_trending.dart';
import 'package:fap_grp7/models/themovieDB/the_movie_db_info.dart';

const apiKey= '42e8cb86b4f3b37110bb30308d5f7ad5';
const theMovieDBMovieTrending= 'https://api.themoviedb.org/3/trending/movie/';
const theMovieDBOnTvTrending= 'https://api.themoviedb.org/3/trending/tv/';

const theMovieDBMovieInfo= 'https://api.themoviedb.org/3/movie';
const theMovieDBOnTvInfo= 'https://api.themoviedb.org/3/tv';

const theMovieDBSearch= 'https://api.themoviedb.org/3/search/multi';

class TheMovieDBModel {
  TrendingMovie? trendingMoviesData;
  TrendingOnTv? trendingOnTvsData;

  MovieInfo? movieInfo;
  OnTvInfo? onTvInfo;

  CreditsList? creditsList;

  SearchResultsList? searchResultsList;

  Future<dynamic>? getTrendingMoviesWeek() async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBMovieTrending/week?api_key=$apiKey'));
    if (response.statusCode == 200) {
      trendingMoviesData = TrendingMovie.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Trending This Week');
    }

    return trendingMoviesData;
  }

  Future<dynamic>? getTrendingMoviesDay() async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBMovieTrending/day?api_key=$apiKey'));
    if (response.statusCode == 200) {
      trendingMoviesData = TrendingMovie.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Trending This Week');
    }

    return trendingMoviesData;
  }

  Future<dynamic>? getTrendingOnTvWeek() async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBOnTvTrending/week?api_key=$apiKey'));
    if (response.statusCode == 200) {
      trendingOnTvsData = TrendingOnTv.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Trending This Week');
    }

    return trendingOnTvsData;
  }

  Future<dynamic>? getTrendingOnTvDay() async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBOnTvTrending/day?api_key=$apiKey'));
    if (response.statusCode == 200) {
      trendingOnTvsData = TrendingOnTv.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Trending This Week');
    }

    return trendingOnTvsData;
  }

  Future<dynamic>? getMovieInfo(int id) async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBMovieInfo/$id?api_key=$apiKey'));
    if (response.statusCode == 200) {
      movieInfo= MovieInfo.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Movie Information');
    }

    return movieInfo;

  }

  Future<dynamic>? getOnTvInfo(int id) async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBOnTvInfo/$id?api_key=$apiKey'));
    if (response.statusCode == 200) {
      onTvInfo= OnTvInfo.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Tv Show Information');
    }

    return onTvInfo;
  }

  Future<dynamic>? getMovieCredits(int id) async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBMovieInfo/$id/credits?api_key=$apiKey'));
    if (response.statusCode == 200) {
      creditsList= CreditsList.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Movie Credits');
    }

    return creditsList;
  }

  Future<dynamic>? getOnTvCredits(int id) async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBOnTvInfo/$id/credits?api_key=$apiKey'));
    if (response.statusCode == 200) {
      creditsList= CreditsList.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Movie Credits');
    }

    return creditsList;
  }


  Future<dynamic>? getSearchInfo(String query) async{
    http.Response response= await http.get(
        Uri.parse('$theMovieDBSearch?api_key=$apiKey&language=en-US&query=$query&page=1'));
    if (response.statusCode == 200) {
      searchResultsList= SearchResultsList.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Search Results');
    }

    return searchResultsList;
  }


}
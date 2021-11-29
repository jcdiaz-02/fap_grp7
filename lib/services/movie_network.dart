import 'package:fap_grp7/models/movie.dart';
import 'package:fap_grp7/models/movie_b.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey= 'k_inuqjr8g';
const apiKeyTest= 'k_mj7u6mxa';

const imdbInTheaters=  'https://imdb-api.com/en/API/InTheaters';
const imdbBoxOffice=  'https://imdb-api.com/en/API/BoxOffice';
const imdbComingSoon= 'https://imdb-api.com/en/API/ComingSoon';

class MovieModel {
  Movie? movieData;
  MovieB? movieDataB;

  Future<dynamic>? getInTheaters() async{
    http.Response response= await http.get(
        Uri.parse('$imdbInTheaters/$apiKeyTest'));
    if (response.statusCode == 200) {
      movieData = Movie.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting In Theaters');
    }

    return movieData;
  }

  Future<dynamic>? getBoxOffice() async{
    http.Response response= await http.get(
        Uri.parse('$imdbBoxOffice/$apiKeyTest'));
    if (response.statusCode == 200) {
      movieDataB = MovieB.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Box Office');
    }

    return movieDataB;
  }

  Future<dynamic>? getComingSoon() async{
    http.Response response= await http.get(
        Uri.parse('$imdbComingSoon/$apiKeyTest'));
    if (response.statusCode == 200) {
      movieData = Movie.fromJson(jsonDecode(response.body));
    }
    else{
      print('Error Getting Coming Soon');
    }

    return movieData;
  }




  Future<String> test() async{
    return 'hello';
  }
}
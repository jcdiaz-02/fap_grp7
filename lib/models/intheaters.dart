import 'movie_genres.dart';

class InTheaters {
  final String? id;
  final String? title;
  final String? year;
  final String? image;
  final String? releaseState;
  final String? plot;
  final List<MovieGenres  >? genreList;

  InTheaters({this.id, this.title, this.year, this.image, this.releaseState, this.plot, this.genreList});


  factory InTheaters.fromJson(Map<String, dynamic> json) {
    List<dynamic> genreListData = json['genreList'];

    List<MovieGenres>? genreList = [];

    genreListData.forEach((item) {
      var items = MovieGenres.fromJson(item);
      genreList.add(items);
    });

    //print(json);
    return InTheaters(
        id: json['id'],
        title: json['title'],
        year:  json['year'],
        image: json['image'],
        plot: json['plot'],
        releaseState: json['releaseState'],
        genreList:  genreList
    );
  }

}
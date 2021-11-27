import 'intheaters.dart';
import 'boxoffice.dart';
import 'comingsoon.dart';

class Movie {
  final List<InTheaters>? listInTheaters;
  final List<BoxOffice>? listBoxOffice;
  final List<ComingSoon>? listComingSoon;


  Movie({this.listInTheaters, this.listComingSoon, this.listBoxOffice});

  factory Movie.fromJson(Map<String, dynamic> json) {

    List<dynamic> inTheaterData = json['items'];

    List<InTheaters>? listInTheaters = [];


    inTheaterData.forEach((item) {
      var items = InTheaters.fromJson(item);
      listInTheaters.add(items);
    });


    List<dynamic> boxOfficeData = json['items'];

    List<BoxOffice>? listBoxOffice= [];

    boxOfficeData.forEach((item) {
      var items = BoxOffice.fromJson(item);
      listBoxOffice.add(items);
    });


    List<dynamic> comingSoonData = json['items'];

    List<ComingSoon>? listComingSoon = [];

    comingSoonData.forEach((item) {
      var items = ComingSoon.fromJson(item);
      listComingSoon.add(items);
    });

    return Movie(
        listInTheaters: listInTheaters,
        listBoxOffice: listBoxOffice,
        listComingSoon: listComingSoon
    );
  }

}
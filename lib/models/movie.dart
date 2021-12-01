import 'intheaters.dart';
import 'comingsoon.dart';

class Movie {
  final List<InTheaters>? listInTheaters;
  final List<ComingSoon>? listComingSoon;


  Movie({this.listInTheaters, this.listComingSoon,});

  factory Movie.fromJson(Map<String, dynamic> json) {

    List<dynamic> inTheaterData = json['items'];


    List<InTheaters>? listInTheaters = [];


    inTheaterData.forEach((item) {
      var items = InTheaters.fromJson(item);
      listInTheaters.add(items);
    });


    List<dynamic> comingSoonData = json['items'];

    List<ComingSoon>? listComingSoon = [];

    comingSoonData.forEach((item) {
      var items = ComingSoon.fromJson(item);
      listComingSoon.add(items);
    });

    return Movie(
        listInTheaters: listInTheaters,
        listComingSoon: listComingSoon
    );
  }

}
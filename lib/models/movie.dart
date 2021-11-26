import 'intheaters.dart';

class Movie {
  final List<InTheaters>? listInTheaters;
 //final List<Daily>? daily;

  Movie({this.listInTheaters});

  factory Movie.fromJson(Map<String, dynamic> json) {

    List<dynamic> inTheaterData = json['items'];

    List<InTheaters>? listInTheaters = [];


    inTheaterData.forEach((item) {
      var items = InTheaters.fromJson(item);
      listInTheaters.add(items);
    });

    return Movie(
        listInTheaters: listInTheaters
    );
  }

}
import 'boxoffice.dart';

class MovieB {

  final List<BoxOffice>? listBoxOffice;


  MovieB({this.listBoxOffice});

  factory MovieB.fromJson(Map<String, dynamic> json) {

    List<dynamic> boxOfficeData = json['items'];

    List<BoxOffice>? listBoxOffice= [];

    boxOfficeData.forEach((item) {
      var items = BoxOffice.fromJson(item);
      listBoxOffice.add(items);
    });
    return MovieB(
        listBoxOffice: listBoxOffice,
    );
  }

}
import 'genre.dart';

class MainGenreList{
  MainGenreList({this.genres});

  List<Genre>? genres;


  List<Genre>? getMainGenreList(){
    genres=  [
      Genre("Action",),
      Genre("Crime",),
      Genre("Comedy",),
      Genre("Drama",),
      Genre("Horror",),
      Genre("Animation"),];
    //genres!.forEach((element) { print(element.title);});

    return genres ;
  }


}



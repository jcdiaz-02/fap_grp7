import 'lists_info.dart';

class MoviesList {
  final List<MovieListsInfo>? movieList;

  MoviesList({this.movieList});

  factory MoviesList.fromJson(Map<String, dynamic> json) {

    List<dynamic>  nowPlayingData= json['results'];

    List<MovieListsInfo>? moviesList=[];

    nowPlayingData.forEach((item) {
      var movieListItems= MovieListsInfo.fromJson(item);
      moviesList.add(movieListItems);
    });

    return MoviesList(
        movieList: moviesList
    );
  }
}

class OnTvsList {
  final List<OnTvListsInfo>? onTvList;

  OnTvsList({this.onTvList});

  factory OnTvsList.fromJson(Map<String, dynamic> json) {

    List<dynamic>  nowPlayingData= json['results'];

    List<OnTvListsInfo>? onTvList=[];

    nowPlayingData.forEach((item) {
      var onTvListItems= OnTvListsInfo.fromJson(item);
      onTvList.add(onTvListItems);
    });

    return OnTvsList(
        onTvList: onTvList
    );
  }
}
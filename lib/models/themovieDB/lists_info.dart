class MovieListsInfo{
  final int? id;
  final String? title;
  final String? releaseDate;
  final String? posterPath;
  final String? overview;
  final num? voteAverage;
  final int? type;


  MovieListsInfo({this.id, this.title,  this.releaseDate, this.posterPath, this.overview,this.voteAverage, this.type});


  factory MovieListsInfo.fromJson(Map<String, dynamic> json){

    return MovieListsInfo(
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
        type: 0
    );
  }
}


class OnTvListsInfo{
  final int? id;
  final String? title;
  final String? releaseDate;
  final String? posterPath;
  final String? overview;
  final num? voteAverage;
  final int? type;


  OnTvListsInfo({this.id, this.title,  this.releaseDate, this.posterPath, this.overview,this.voteAverage, this.type});


  factory OnTvListsInfo.fromJson(Map<String, dynamic> json){

    return OnTvListsInfo(
        id: json['id'],
        title: json['name'],
        releaseDate: json['first_air_date'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
        type: 1
    );
  }
}


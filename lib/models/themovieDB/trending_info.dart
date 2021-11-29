
class TrendingMovieInfo{
  final int? id;
  final String? title;
  final String? posterPath;
  final double? voteAverage;

  TrendingMovieInfo({this.id, this.title, this.posterPath, this.voteAverage});

  factory TrendingMovieInfo.fromJson(Map<String, dynamic> json){
    return TrendingMovieInfo(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      voteAverage: json['vote_average']
    );
  }
}


class TrendingOnTvInfo{
  final int? id;
  final String? title;
  final String? posterPath;
  final double? voteAverage;

  TrendingOnTvInfo({this.id, this.title, this.posterPath, this.voteAverage});

  factory TrendingOnTvInfo.fromJson(Map<String, dynamic> json){
    return TrendingOnTvInfo(
        id: json['id'],
        title: json['name'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average']
    );
  }
}
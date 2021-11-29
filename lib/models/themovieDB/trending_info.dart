
class TrendingInfo{
  final int? id;
  final String? title;
  final String? posterPath;
  final double? voteAverage;

  TrendingInfo({this.id, this.title, this.posterPath, this.voteAverage});

  factory TrendingInfo.fromJson(Map<String, dynamic> json){
    return TrendingInfo(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      voteAverage: json['vote_average']
    );
  }
}
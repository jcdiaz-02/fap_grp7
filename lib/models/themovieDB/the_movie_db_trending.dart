import 'trending_info.dart';

class TrendingMovie {
  final List<TrendingMovieInfo>? trending;

  TrendingMovie({this.trending});

  factory TrendingMovie.fromJson(Map<String, dynamic> json) {

    List<dynamic>  trendingData= json['results'];

    List<TrendingMovieInfo>? trendingList=[];

    trendingData.forEach((item) {
      var trendingItmes= TrendingMovieInfo.fromJson(item);
      trendingList.add(trendingItmes);
    });

    return TrendingMovie(
      trending: trendingList
    );
  }
}

class TrendingOnTv {
  final List<TrendingOnTvInfo>? trending;

  TrendingOnTv({this.trending});

  factory TrendingOnTv.fromJson(Map<String, dynamic> json) {

    List<dynamic>  trendingData= json['results'];

    List<TrendingOnTvInfo>? trendingList=[];

    trendingData.forEach((item) {
      var trendingItems= TrendingOnTvInfo.fromJson(item);
      trendingList.add(trendingItems);
    });

    return TrendingOnTv(
        trending: trendingList
    );
  }
}






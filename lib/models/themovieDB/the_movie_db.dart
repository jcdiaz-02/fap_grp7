import 'trending_info.dart';

class Trending {
  final List<TrendingInfo>? trendingThisWeek;

  Trending({this.trendingThisWeek});

  factory Trending.fromJson(Map<String, dynamic> json) {

    List<dynamic>  trendingData= json['results'];

    List<TrendingInfo>? trendingList=[];

    trendingData.forEach((item) {
      var trendingItmes= TrendingInfo.fromJson(item);

      trendingList.add(trendingItmes);
    });

    return Trending(
      trendingThisWeek: trendingList
    );
  }
}

class MovieInfo {
  final int? id;
  final String? title;
  final String? overview;
  final String? status;
  final double? voteAverage;
  final String? releaseDate;
  final String? backdropPath;
  final int? runTime;

  MovieInfo({this.id, this.title, this.overview, this.status, this.voteAverage, this.releaseDate, this.backdropPath, this.runTime});

  factory MovieInfo.fromJson(Map<String, dynamic> json){
    return MovieInfo(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      status: json['status'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
      backdropPath: json['backdrop_path'],
      runTime: json['runtime'],
    );
  }
}

class OnTvInfo{
  final int? id;
  final String? title;
  final String? overview;
  final String? status;
  final double? voteAverage;
  final String? releaseDate;
  final String? backdropPath;
  final int? runTime;

  OnTvInfo({this.id, this.title, this.overview, this.status, this.voteAverage, this.releaseDate, this.backdropPath, this.runTime});

  factory OnTvInfo.fromJson(Map<String, dynamic> json){
    return OnTvInfo(
      id: json['id'],
      title: json['name'],
      overview: json['overview'],
      status: json['status'],
      voteAverage: json['vote_average'],
      backdropPath: json['backdrop_path'],
      runTime: json['episode_run_time'][0],
    );
  }
}




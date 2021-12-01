class SimilarMovieResults {
  final int? id;
  final String? title;
  final String? mediaType;
  final String? releaseDate;
  final String? posterPath;
  final num? voteAverage;
  final int? type;

  SimilarMovieResults(
      {this.id,
      this.title,
      this.mediaType,
      this.releaseDate,
      this.posterPath,
      this.voteAverage,
      this.type});

  factory SimilarMovieResults.fromJson(Map<String, dynamic> json) {
    return SimilarMovieResults(
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'],
        type: 0);
  }
}

class SimilarTVResults {
  final int? id;
  final String? title;
  final String? mediaType;
  final String? releaseDate;
  final String? posterPath;
  final num? voteAverage;
  final int? type;

  SimilarTVResults(
      {this.id,
      this.title,
      this.mediaType,
      this.releaseDate,
      this.posterPath,
      this.voteAverage,
      this.type});

  factory SimilarTVResults.fromJson(Map<String, dynamic> json) {
    return SimilarTVResults(
        id: json['id'],
        title: json['name'],
        releaseDate: json['first_air_date'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'],
        type: 1);
  }
}

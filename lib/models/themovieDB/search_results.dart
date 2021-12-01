class SearchResults {
  final int? id;
  final String? title;
  final String? mediaType;
  final String? releaseDate;
  final String? posterPath;
  final num? voteAverage;
  final int? type;

  SearchResults(
      {this.id,
      this.title,
      this.mediaType,
      this.releaseDate,
      this.posterPath,
      this.voteAverage,
      this.type});

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    var title;
    var releaseDate;
    var type;

    if (json['media_type'] == 'movie') {
      title = json['title'];
      releaseDate = json['release_date'];
      type = 0;
    } else {
      title = json['name'];
      releaseDate = json['first_air_date'];
      type = 1;
    }

    return SearchResults(
        id: json['id'],
        title: title,
        mediaType: json['media_type'],
        releaseDate: releaseDate,
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'],
        type: type);
  }
}

class MovieGenres{
  final String? genre;

  MovieGenres({this.genre});

  factory MovieGenres.fromJson(Map<String, dynamic> json) {
    return MovieGenres(
        genre: json['value']
    );

  }
}
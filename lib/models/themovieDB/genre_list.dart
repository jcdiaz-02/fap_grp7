class GenreList{
  final int? genreId;
  final String? genreName;

  GenreList({this.genreId, this.genreName});

  factory GenreList.fromJson(Map<String, dynamic> json) {
    return GenreList(
        genreId: json['id'],
        genreName: json['name']
    );

  }
}
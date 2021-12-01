import 'genre_list.dart';
import 'credits_info.dart';
import 'search_results.dart';
import 'similar_movie_results.dart';
import 'similar_tv_results.dart';

class MovieInfo {
  final int? id;
  final String? title;
  final String? overview;
  final String? status;
  final double? voteAverage;
  final String? releaseDate;
  final String? backdropPath;
  final int? runTime;
  final List<GenreList>? genreInfoList;

  MovieInfo(
      {this.id,
      this.title,
      this.overview,
      this.status,
      this.voteAverage,
      this.releaseDate,
      this.backdropPath,
      this.runTime,
      this.genreInfoList});

  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    return MovieInfo(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        status: json['status'],
        voteAverage: json['vote_average'],
        releaseDate: json['release_date'],
        backdropPath: json['backdrop_path'],
        runTime: json['runtime'],
        genreInfoList: getGenreInfoList(json['genres']));
  }
}

class OnTvInfo {
  final int? id;
  final String? title;
  final String? overview;
  final String? status;
  final double? voteAverage;
  final String? releaseDate;
  final String? backdropPath;
  final int? runTime;
  final List<GenreList>? genreInfoList;

  OnTvInfo(
      {this.id,
      this.title,
      this.overview,
      this.status,
      this.voteAverage,
      this.releaseDate,
      this.backdropPath,
      this.runTime,
      this.genreInfoList});

  factory OnTvInfo.fromJson(Map<String, dynamic> json) {
    return OnTvInfo(
        id: json['id'],
        title: json['name'],
        overview: json['overview'],
        status: json['status'],
        voteAverage: json['vote_average'],
        releaseDate: json['first_air_date'],
        backdropPath: json['backdrop_path'],
        runTime: json['episode_run_time'][0],
        genreInfoList: getGenreInfoList(json['genres']));
  }
}

class CreditsList {
  final List<Cast>? castList;
  final List<Crew>? crewList;

  CreditsList({this.castList, this.crewList});

  factory CreditsList.fromJson(Map<String, dynamic> json) {
    List<dynamic> castData = json['cast'];
    List<dynamic> crewData = json['crew'];

    List<Cast>? castList = [];
    List<Crew>? crewList = [];

    castData.forEach((item) {
      var cast = Cast.fromJson(item);
      castList.add(cast);
    });

    crewData.forEach((item) {
      var crew = Crew.fromJson(item);
      crewList.add(crew);
    });

    return CreditsList(
      castList: castList,
      crewList: crewList,
    );
  }
}

class SearchResultsList {
  final List<SearchResults>? searchResultsList;

  SearchResultsList({this.searchResultsList});

  factory SearchResultsList.fromJson(Map<String, dynamic> json) {
    List<dynamic> searchResultsData = json['results'];

    List<SearchResults>? searchResultsList = [];

    searchResultsData.forEach((item) {});

    for (int i = 0; i < searchResultsData.length; i++) {
      var searchItem = SearchResults.fromJson(searchResultsData[i]);
      if (searchItem.mediaType == 'person') {
        continue;
      }
      searchResultsList.add(searchItem);
    }

    return SearchResultsList(
      searchResultsList: searchResultsList,
    );
  }
}

List<GenreList>? getGenreInfoList(json) {
  List<dynamic> genreListData = json;

  List<GenreList>? genreList = [];

  genreListData.forEach((item) {
    var items = GenreList.fromJson(item);
    genreList.add(items);
  });

  return genreList;
}

class SimilarMovieResultsList {
  final List<SimilarMovieResults>? similarMovieResultsList;

  SimilarMovieResultsList({this.similarMovieResultsList});

  factory SimilarMovieResultsList.fromJson(Map<String, dynamic> json) {
    List<dynamic> similarMovieResultsData = json['results'];

    List<SimilarMovieResults>? similarMovieResultsList = [];

    similarMovieResultsData.forEach((item) {});

    for (int i = 0; i < similarMovieResultsData.length; i++) {
      var searchItem = SimilarMovieResults.fromJson(similarMovieResultsData[i]);
      similarMovieResultsList.add(searchItem);
    }
    return SimilarMovieResultsList(
      similarMovieResultsList: similarMovieResultsList,
    );
  }
}

class SimilarTVResultsList {
  final List<SimilarTVResults>? similarTVResultsList;

  SimilarTVResultsList({this.similarTVResultsList});

  factory SimilarTVResultsList.fromJson(Map<String, dynamic> json) {
    List<dynamic> similarTVResultsData = json['results'];

    List<SimilarTVResults>? similarTVResultsList = [];

    similarTVResultsData.forEach((item) {});

    for (int i = 0; i < similarTVResultsData.length; i++) {
      var searchItem = SimilarTVResults.fromJson(similarTVResultsData[i]);
      similarTVResultsList.add(searchItem);
    }
    return SimilarTVResultsList(
      similarTVResultsList: similarTVResultsList,
    );
  }
}

import 'package:flutter/material.dart';
import '../components/movies_list.dart';
import 'package:fap_grp7/services/themoviedb_network.dart';

class MoviesNowPlaying extends StatefulWidget {
  const MoviesNowPlaying({Key? key}) : super(key: key);

  @override
  _MoviesNowPlayingState createState() => _MoviesNowPlayingState();
}

class _MoviesNowPlayingState extends State<MoviesNowPlaying>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: TheMovieDBModel().getMovieNowPlaying(),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          //print('the snapshot data:');
          if (snapshot.data == null) {
            return Text("Error getting Movies");
          } else {
            return MovieList(listMovies: snapshot.data.movieList,  );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  }
}

import 'package:fap_grp7/services/themoviedb_network.dart';
import 'package:flutter/material.dart';
import '../components/movies_list.dart';

class MoviesUpcoming extends StatefulWidget {
  const MoviesUpcoming({Key? key}) : super(key: key);

  @override
  _MoviesUpcomingState createState() => _MoviesUpcomingState();
}

class _MoviesUpcomingState extends State<MoviesUpcoming> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: TheMovieDBModel().getMovieUpcoming(),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          //print('the snapshot data:');
          if (snapshot.data == null) {
            return Text("Error getting Movies");
          } else {
            return MovieList(listMovies: snapshot.data.movieList,);
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );;
  }
}

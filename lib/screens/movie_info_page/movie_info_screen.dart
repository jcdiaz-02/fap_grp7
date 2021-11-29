import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';
import 'package:fap_grp7/services/themoviedb_network.dart';

import 'components/movie_info_widget.dart';

class MovieInfoScreen extends StatefulWidget {
  const MovieInfoScreen({Key? key, @required this.movieId, @required this.type}) : super(key: key);

  final movieId;
  final type;
  @override
  _MovieInfoScreenState createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: (widget.type==0)? MovieInfoFutureBuilderWidget() : OnTvInfoFutureBuilderWidget(),
    ));
  }

  Widget MovieInfoFutureBuilderWidget(){
    return FutureBuilder<dynamic>(
        future: TheMovieDBModel().getMovieInfo(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieInfo= snapshot.data;
            if (snapshot.data == null) {
              return Text("Error getting Information");
            } else {
              return MovieInfoWidget(movieInfo:snapshot.data);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  Widget OnTvInfoFutureBuilderWidget(){
    return FutureBuilder<dynamic>(
        future: TheMovieDBModel().getOnTvInfo(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieInfo= snapshot.data;
            if (snapshot.data == null) {
              return Text("Error getting Information");
            } else {
              return  MovieInfoWidget(movieInfo:snapshot.data);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}

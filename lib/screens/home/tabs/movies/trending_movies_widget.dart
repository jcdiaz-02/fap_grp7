import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/services/themoviedb_network.dart';

import 'package:fap_grp7/screens/home/components/trending_card_widget.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({Key? key}) : super(key: key);

  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TrendingWidget(future: TheMovieDBModel().getTrendingMoviesWeek(), msg: 'This Week', type: 0,),
          TrendingWidget(future: TheMovieDBModel().getTrendingMoviesDay(), msg: 'Today', type: 0),
        ],
      ),
    );
  }
}




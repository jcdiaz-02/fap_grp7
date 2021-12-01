import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/services/themoviedb_network.dart';

import 'package:fap_grp7/screens/home/components/trending_card_widget.dart';

class TrendingOnTvs extends StatefulWidget {
  const TrendingOnTvs({Key? key}) : super(key: key);

  @override
  _TrendingOnTvsState createState() => _TrendingOnTvsState();
}

class _TrendingOnTvsState extends State<TrendingOnTvs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TrendingWidget(future: TheMovieDBModel().getTrendingOnTvWeek(), msg: 'This Week', type: 1),
          TrendingWidget(future: TheMovieDBModel().getTrendingOnTvDay(), msg: 'Today', type: 1),
        ],
      ),
    );
  }

}


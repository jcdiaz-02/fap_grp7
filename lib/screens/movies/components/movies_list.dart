import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:fap_grp7/constants.dart';
import 'package:fap_grp7/widgets/info_card_widget.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key, this.listMovies, }) : super(key: key);

  final listMovies;

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
        itemCount: widget.listMovies.length,
        itemBuilder: (context, index) {
        return InfoCardWidget(info: widget.listMovies[index] );
      },
    ));
  }
}

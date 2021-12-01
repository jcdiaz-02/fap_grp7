import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:fap_grp7/constants.dart';
import 'package:fap_grp7/widgets/info_card_widget.dart';

class OnTvList extends StatefulWidget {
  const OnTvList({Key? key, this.listMovies, }) : super(key: key);

  final listMovies;

  @override
  _OnTvListState createState() => _OnTvListState();
}

class _OnTvListState extends State<OnTvList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: widget.listMovies.length,
          itemBuilder: (context, index) {
            return InfoCardWidget(info: widget.listMovies[index] );
          },
        ));
  }
}

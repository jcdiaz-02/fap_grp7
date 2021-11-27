import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:fap_grp7/constants.dart';
import 'genre_list.dart';

class MovieList3 extends StatefulWidget {
  const MovieList3({Key? key, this.listInTheaters}) : super(key: key);

  final listInTheaters;

  @override
  _MovieList3State createState() => _MovieList3State();
}

class _MovieList3State extends State<MovieList3> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
        itemCount: widget.listInTheaters.length,
        itemBuilder: (context, index) {
        return Container(
          height: 200,
          margin:
              const EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 7,
                  offset: Offset(0, 5),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 130,
                child: ClipRRect(
                  borderRadius: kCornerRadius,
                  child: Image.network(
                    '${widget.listInTheaters[index].image}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 200,
                        child: Text('${widget.listInTheaters[index].title}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kMovieCardTitleStyle)),
                    Text(
                      '${widget.listInTheaters[index].year}',
                      style: kMovieCardYearStyle,
                    ),
                    GenreList(
                        genreList: widget.listInTheaters[index].genreList),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      width: 200,
                      child: Text(
                        '${widget.listInTheaters[index].plot}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: kMovieCardPlotStyle,
                      ),
                    ),
                    Container(
                        width: 180,
                        child: Text(
                            'Release Date: ${widget.listInTheaters[index].releaseState}',
                            style: kMovieCardReleaseStateStyle)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}

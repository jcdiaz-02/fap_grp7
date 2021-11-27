import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:fap_grp7/constants.dart';
import 'genre_list.dart';

class MovieList2 extends StatefulWidget {
  const MovieList2({Key? key, this.listBoxOffice}) : super(key: key);

  final listBoxOffice;

  @override
  _MovieList2State createState() => _MovieList2State();
}

class _MovieList2State extends State<MovieList2> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
          itemCount: widget.listBoxOffice.length,
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
                        '${widget.listBoxOffice[index].image}',
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
                            child: Text('${widget.listBoxOffice[index].title}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: kMovieCardTitleStyle)),
                        Text(
                          '${widget.listBoxOffice[index].rank}',
                          style: kMovieCardYearStyle,
                        ),
                        GenreList(
                            genreList: widget.listBoxOffice[index].genreList),
                        Container(
                            width: 180,
                            child: Text(
                                'Release Date: ${widget.listBoxOffice[index].weeks}',
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

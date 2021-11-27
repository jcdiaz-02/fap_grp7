import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';

class GenreList extends StatefulWidget {
  const GenreList({Key? key,@required this.genreList}) : super(key: key);

  final genreList;
  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 200,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: widget.genreList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index1) {
            return Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.5, color: kPrimaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  '${widget.genreList[index1].genre} ',
                  style: kMovieCardGenreStyle,
                ),
              ),
            );
          }),
    );
  }
}

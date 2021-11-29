import 'package:fap_grp7/constants.dart';
import 'package:flutter/material.dart';

class TrendingMoviesList extends StatefulWidget {
  const TrendingMoviesList({Key? key, this.trendingData})
      : super(key: key);

  final trendingData;
  @override
  _TrendingMoviesListState createState() => _TrendingMoviesListState();
}

class _TrendingMoviesListState extends State<TrendingMoviesList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 154,
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(kTrendingImageBorderRadius),
                        child: Image.network(
                            '$kImageURL/w154/${widget.trendingData[index].posterPath}'),
                      ),
                      Container(
                        height: 230,
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: kTrendingImageBorderRadius, bottomLeft: kTrendingImageBorderRadius),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.black.withAlpha(0),
                              Colors.black12,
                              Colors.black45
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${widget.trendingData[index].voteAverage}',
                              style: TextStyle(color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${widget.trendingData[index].title}',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

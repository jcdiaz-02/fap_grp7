import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';
import 'package:intl/intl.dart';

class SearchResultsListWidget extends StatefulWidget {
  const SearchResultsListWidget({Key? key, this.searchResultsList, this.type})
      : super(key: key);

  final searchResultsList;
  final type;

  @override
  _SearchResultsListWidgetState createState() =>
      _SearchResultsListWidgetState();
}

class _SearchResultsListWidgetState extends State<SearchResultsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
          itemCount: widget.searchResultsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                kGoToInfoScreen(context, widget.searchResultsList[index].id, widget.searchResultsList[index].type);
              },
              child: Card(
                shadowColor: Colors.grey,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ) ,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: kCornerRadius,
                      child: Image.network(
                          (widget.searchResultsList[index].posterPath != null)
                              ? '$kImageURL/w154${widget.searchResultsList[index].posterPath}'
                              : kImageUnavailable,
                        width: 154,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.searchResultsList[index].title}',
                            style: kMovieCardTitleStyle,
                            maxLines: 2,
                          ),
                          Text(
                            (widget.searchResultsList[index].releaseDate != null)
                                ?'${getDateFromReleaseState(widget.searchResultsList[index].releaseDate)}'
                              :'No Date',
                            style: kMovieCardYearStyle,
                            maxLines: 2,
                          ),

                          Text(
                            '${widget.searchResultsList[index].mediaType}',
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Text(
                            '${widget.searchResultsList[index].overview}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: kMovieCardPlotStyle,
                          ),

                          SizedBox(
                            height: 10
                          ),
                          Row(
                            children: [
                              const Icon(
                                  Icons.star_outlined,
                                  color: Colors.amber,
                                  size: 16
                              ),
                              SizedBox(
                                width: 5
                              ),
                              Text(
                                (widget.searchResultsList[index].voteAverage != 0.0)
                                    ?'${widget.searchResultsList[index].voteAverage}'
                                    :'No Ratings Available',
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}


String getDateFromReleaseState(String releaseDate) {
  var date = DateTime.parse(releaseDate);
  var formatter = new DateFormat.yMMMMd('en_US');
  return formatter.format(date);
}
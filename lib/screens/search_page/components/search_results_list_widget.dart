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
            return SafeArea(
              child: GestureDetector(
                onTap: () {
                  kGoToInfoScreen(context, widget.searchResultsList[index].id,
                      widget.searchResultsList[index].type);
                },
                child: Container(
                  color: Colors.white,
                  width: 500,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Image.network(
                        (widget.searchResultsList[index].posterPath != null)
                            ? '$kImageURL/w92${widget.searchResultsList[index].posterPath}'
                            : kImageUnavailable,
                        width: 92,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.searchResultsList[index].title}',
                            maxLines: 2,
                          ),
                          if (widget.searchResultsList[index].mediaType != null)
                            Text(
                              '${widget.searchResultsList[index].mediaType}',
                              maxLines: 2,
                            )
                          else if (widget.type == 0)
                            const Text(
                              'movie',
                              maxLines: 2,
                            )
                          else if (widget.type == 1)
                            const Text(
                              'tv',
                              maxLines: 2,
                            ),
                          Text(
                            '${widget.searchResultsList[index].releaseDate}',
                            maxLines: 2,
                          ),
                          Text(
                            '${widget.searchResultsList[index].voteAverage}',
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
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

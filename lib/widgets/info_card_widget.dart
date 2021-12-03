import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';
import 'package:intl/intl.dart';


import 'package:fap_grp7/models/themovieDB/the_movie_db_info.dart';
import 'package:fap_grp7/models/themovieDB/lists_info.dart';
import 'package:fap_grp7/models/themovieDB/search_results.dart';

class InfoCardWidget extends StatefulWidget {
  const InfoCardWidget({Key? key, this.info,}) : super(key: key);

  final info;

  @override
  _InfoCardWidgetState createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData= MediaQuery.of(context);
    return GestureDetector(
      onTap: (){
        kGoToInfoScreen(context, widget.info.id, widget.info.type);
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
                (widget.info.posterPath != null)
                    ? '$kImageURL/w154${widget.info.posterPath}'
                    : kImageUnavailable,
                width: 154,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.info.title}',
                    style: kMovieCardTitleStyle,
                    maxLines: 2,
                  ),
                  Text(
                    (widget.info.releaseDate != null)
                        ?'${getDateFromReleaseState(widget.info.releaseDate)}'
                        :'No Date',
                    style: kMovieCardYearStyle,
                    maxLines: 2,
                  ),
                  if(widget.info is SearchResults) Text('${widget.info.mediaType}',maxLines: 2,)
                  else SizedBox(height: 10,),

                  SizedBox(
                    height: 10,
                  ),

                  (widget.info is SearchResults || widget.info is MovieListsInfo || widget.info is OnTvListsInfo)? Text('${widget.info.overview}',maxLines: 2,overflow: TextOverflow.ellipsis,): SizedBox(height: 16,),
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
                        (widget.info.voteAverage != 0.0)
                            ?'${widget.info.voteAverage}'
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
  }
}


String getDateFromReleaseState(String releaseDate) {
  var date = DateTime.parse(releaseDate);
  var formatter = new DateFormat.yMMMMd('en_US');
  return formatter.format(date);
}

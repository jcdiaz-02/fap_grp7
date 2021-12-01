import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';
import 'package:intl/intl.dart';

class InfoCardWidget extends StatefulWidget {
  const InfoCardWidget({Key? key, this.info}) : super(key: key);

  final info;
  
  @override
  _InfoCardWidgetState createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
          Container(
            width: 150,
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

                Text(
                  '${widget.info.mediaType}',
                  maxLines: 2,
                ),
                SizedBox(
                  height: 20,
                ),

                Text(
                  '${widget.info.overview}',
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
    );
  }
}


String getDateFromReleaseState(String releaseDate) {
  var date = DateTime.parse(releaseDate);
  var formatter = new DateFormat.yMMMMd('en_US');
  return formatter.format(date);
}

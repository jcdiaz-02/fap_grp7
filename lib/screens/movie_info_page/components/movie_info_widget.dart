import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';

import 'package:intl/intl.dart';

class MovieInfoWidget extends StatefulWidget {
  const MovieInfoWidget({Key? key, this.movieInfo}) : super(key: key);

  final movieInfo;
  @override
  _MovieInfoWidgetState createState() => _MovieInfoWidgetState();
}

class _MovieInfoWidgetState extends State<MovieInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: kMovieInfoBackDropBorderRadius,
                  child: Image.network(
                      '$kImageURL/w500/${widget.movieInfo.backdropPath}'),
                  //  ${snapshot.data.backdropPath}
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    fillColor: kPrimaryColor,
                    shape: CircleBorder(),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.movieInfo.title}',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Average Rating: ${widget.movieInfo.voteAverage}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kSubColor2,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                            width: 5
                        ),
                        const Icon(
                            Icons.star_outlined,
                            color: Colors.amber,
                            size: 16
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 5
                    ),
                    Text(
                      (widget.movieInfo.releaseDate != null)?
                        '${getDateFromReleaseState(widget.movieInfo.releaseDate)} | ${durationToString(widget.movieInfo.runTime)}'
                        : '${durationToString(widget.movieInfo.runTime)} /episode' ,
                      style: TextStyle(
                        color: kSubColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 30
                    ),

                    Text(
                      'Overview',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),

                    Text(
                      '${widget.movieInfo.overview}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        );
  }
}

String durationToString(int minutes) {
  if(minutes >= 60) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')} h ${parts[1].padLeft(2, '0')} m';
  } else {
    return '${minutes.toString()} m';
  }
}

String getDateFromReleaseState(String releaseDate) {
  var date = DateTime.parse(releaseDate);
  var formatter = new DateFormat.yMMMMd('en_US');
  return formatter.format(date);
}
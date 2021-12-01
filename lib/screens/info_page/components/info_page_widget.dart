import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';

import 'package:intl/intl.dart';

class InfoPageWidget extends StatefulWidget {
  const InfoPageWidget({Key? key, this.info}) : super(key: key);

  final info;
  @override
  _InfoPageWidgetState createState() => _InfoPageWidgetState();
}

class _InfoPageWidgetState extends State<InfoPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: kMovieInfoBackDropBorderRadius,
          child: (widget.info.backdropPath != null)
              ? Image.network('$kImageURL/w500/${widget.info.backdropPath}')
              : Image.network('https://www.easton.ph/wp-content/themes/realestate-7/images/no-image.png'),
          //  ${snapshot.data.backdropPath}
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(),
              const SizedBox(
                  height: 10
              ),
              GenreListWidget(),
              const SizedBox(
                height: 25
              ),
              OverviewWidget(),
            ],
          ),
        ),

      ],
    );
  }

  Widget TitleWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.info.title}',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Row(
          children: [
            Text(
              'Average Rating: ${widget.info.voteAverage}',
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
          (widget.info.releaseDate != '')?
          '${getDateFromReleaseState(widget.info.releaseDate)} | ${durationToString(widget.info.runTime)}'
              : '${durationToString(widget.info.runTime)} ' ,
          style: TextStyle(
            color: kSubColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget GenreListWidget(){
    return Container(
      height: 25,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: widget.info.genreInfoList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
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
                  '${widget.info.genreInfoList[index].genreName} ',
                  style: kMovieCardGenreStyle,
                ),
              ),
            );
          }),
    );
  }

  Widget OverviewWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),

        Text(
          '${widget.info.overview}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
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
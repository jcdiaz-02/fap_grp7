import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';
import 'package:readmore/readmore.dart';

class InfoPageCreditsWidget extends StatefulWidget {
  const InfoPageCreditsWidget({Key? key,  this.creditsList}) : super(key: key);

  final creditsList;
  @override
  _InfoPageCreditsWidgetState createState() => _InfoPageCreditsWidgetState();
}

class _InfoPageCreditsWidgetState extends State<InfoPageCreditsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      height: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          castCardWidget(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Crew',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          crewCardWidget()
        ],
      ),
    );
  }

  Widget castCardWidget() {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.creditsList.castList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Container(
              padding: const EdgeInsets.only(right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(kCardImageBorderRadius),
                    child: Image.network(
                        (widget.creditsList.castList[index].profilePath != null)?
                          '$kImageURL/w154/${widget.creditsList.castList[index].profilePath}' :
                          'https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png',
                      width: 154,
                    ),
                  ),
                  SizedBox(
                    height: 10
                  ),
                  Container(
                      width: 154,
                      child: ReadMoreText(
                        '${widget.creditsList.castList[index].name}',
                        trimLines: 1,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...',
                        moreStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                      )
                  ),
                  Container(
                      width: 154,
                      child: ReadMoreText(
                        '${widget.creditsList.castList[index].character}',
                        trimLines: 1,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' ',
                        moreStyle: TextStyle(color: kSubColor2, fontSize: 14, fontWeight: FontWeight.bold),
                        style: TextStyle(color: kSubColor2, fontSize: 14, fontWeight: FontWeight.bold),
                      )
                  ),
                ],
              ),
            );
          }
      ),
    );
  }

  Widget crewCardWidget() {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.creditsList.crewList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(kCardImageBorderRadius),
                    child: Image.network(
                      (widget.creditsList.crewList[index].profilePath != null)?
                      '$kImageURL/w154/${widget.creditsList.crewList[index].profilePath}' :
                      kImageUnavailable,
                      width: 154,
                    ),
                  ),
                  SizedBox(
                      height: 10
                  ),
                  Container(
                      width: 154,
                      child: ReadMoreText(
                        '${widget.creditsList.crewList[index].name}',
                        trimLines: 1,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '  ',
                        moreStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                      )
                  ),
                  Container(
                      width: 154,
                      child: ReadMoreText(
                        '${widget.creditsList.crewList[index].job}',
                        trimLines: 1,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' ',
                        moreStyle: TextStyle(color: kSubColor2, fontSize: 14, fontWeight: FontWeight.bold),
                        style: TextStyle(color: kSubColor2, fontSize: 14, fontWeight: FontWeight.bold),
                      )
                  ),
                ],
              ),
            );
          }
      ),
    );
  }


}

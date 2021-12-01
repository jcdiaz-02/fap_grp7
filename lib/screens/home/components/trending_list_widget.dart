import 'package:fap_grp7/constants.dart';
import 'package:flutter/material.dart';

import 'package:fap_grp7/screens/info_page/info_page_screen.dart';

class TrendingList extends StatefulWidget {
  const TrendingList({Key? key,@required this.futureData, @required this.type})
      : super(key: key);

  final futureData;
  final type;
  @override
  _TrendingListState createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                kGoToInfoScreen(context, widget.futureData[index].id, widget.type);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 154,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(kCardImageBorderRadius),
                          child: Image.network(
                              '$kImageURL/w154/${widget.futureData[index].posterPath}'),
                        ),
                        Container(
                          height: 230,
                          padding: const EdgeInsets.all(5.0),
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: kCardImageBorderRadius, bottomLeft: kCardImageBorderRadius),
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
                                '${widget.futureData[index].voteAverage}',
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
                      '${widget.futureData[index].title}',
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
              ),
            );
          }),
    );
  }
}

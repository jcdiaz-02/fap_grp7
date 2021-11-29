import 'package:flutter/material.dart';
import 'trending_list_widget.dart';

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({Key? key, @required this.future, @required this.msg, @required this.type}) : super(key: key);

  final future;
  final msg;
  final type;
  @override
  _TrendingWidgetState createState() => _TrendingWidgetState();
}

//Trending movies this week or today
class _TrendingWidgetState extends State<TrendingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      child: FutureBuilder<dynamic>(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return Text("Error getting Movies");
            } else {
              return Column(
                children: [
                  Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Trending ${widget.msg}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  SizedBox(
                      height: 10
                  ),
                  Expanded(
                      child: TrendingList(
                        futureData: snapshot.data.trending, type: widget.type,
                      )),
                ],
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
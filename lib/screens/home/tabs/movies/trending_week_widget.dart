import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/services/themoviedb_network.dart';

import 'package:fap_grp7/screens/home/components/trending_this_week_list_1.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({Key? key}) : super(key: key);

  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: FutureBuilder<dynamic>(
            future: TheMovieDBModel().getTrendingMoviesWeek(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return Text("Error getting Movies");
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        TrendingWidget(future: TheMovieDBModel().getTrendingMoviesWeek(), type: 'This Week',),
                        TrendingWidget(future: TheMovieDBModel().getTrendingMoviesDay(), type: 'Today',),
                      ],
                    ),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({Key? key, @required this.future, @required this.type}) : super(key: key);

  final future;
  final type;
  @override
  _TrendingWidgetState createState() => _TrendingWidgetState();
}

//Trending movies this week or today
class _TrendingWidgetState extends State<TrendingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
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
                        'Trending ${widget.type}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  Expanded(
                      child: TrendingMoviesList(
                        trendingData: snapshot.data.trendingThisWeek,
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


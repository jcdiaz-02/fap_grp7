import 'package:fap_grp7/screens/home/similar_movies.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';
import 'package:fap_grp7/services/themoviedb_network.dart';

import 'components/info_page_credits_widget.dart';
import 'components/info_page_widget.dart';

class InfoPageScreen extends StatefulWidget {
  const InfoPageScreen({Key? key, @required this.id, @required this.type})
      : super(key: key);

  final id;
  final type;
  @override
  _InfoPageScreenState createState() => _InfoPageScreenState();
}

class _InfoPageScreenState extends State<InfoPageScreen> {
  Future<dynamic>? _query;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          (widget.type == 0)
              ? MovieInfoFutureBuilderWidget()
              : OnTvInfoFutureBuilderWidget(),
          SizedBox(height: 20),
          (widget.type == 0)
              ? MovieCreditsFutureBuilderWidget()
              : OnTvCreditsFutureBuilderWidget(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SimilarMovies(
                      query: _query = TheMovieDBModel()
                          .getSimilarInfo(widget.type, widget.id),
                      type: widget.type);
                }),
              );
            },
            child: const Text(
              'Find Similar',
            ),
            style: ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(
                  width: 4,
                  color: kPrimaryColor,
                )),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                )),
          ),
        ],
      )),
    ));
  }

  Widget MovieInfoFutureBuilderWidget() {
    return FutureBuilder<dynamic>(
        future: TheMovieDBModel().getMovieInfo(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return Text("Error getting Information");
            } else {
              return InfoPageWidget(info: snapshot.data);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget MovieCreditsFutureBuilderWidget() {
    return FutureBuilder<dynamic>(
        future: TheMovieDBModel().getMovieCredits(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return Text("Error getting Information");
            } else {
              return InfoPageCreditsWidget(creditsList: snapshot.data);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget OnTvInfoFutureBuilderWidget() {
    return FutureBuilder<dynamic>(
        future: TheMovieDBModel().getOnTvInfo(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return Text("Error getting Information");
            } else {
              return InfoPageWidget(info: snapshot.data);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget OnTvCreditsFutureBuilderWidget() {
    return FutureBuilder<dynamic>(
        future: TheMovieDBModel().getOnTvCredits(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return Text("Error getting Information");
            } else {
              return InfoPageCreditsWidget(creditsList: snapshot.data);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

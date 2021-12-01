import 'package:fap_grp7/screens/search_page/components/search_results_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';
import 'package:fap_grp7/widgets/navigation_drawer_widget.dart';

class SimilarMovies extends StatefulWidget {
  const SimilarMovies({Key? key, Future<dynamic>? this.query, this.type})
      : super(key: key);
  final query;
  final type;
  @override
  _SimilarMoviesState createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: NavigationDrawerWidget(),
          appBar: AppBar(
            toolbarHeight: 50,
            elevation: 0,
            title: const Text(
              'MovQuiz',
              style: TextStyle(color: kPrimaryColor),
            ),
            centerTitle: true,
            backgroundColor: kBackgroundColor,
            iconTheme: IconThemeData(color: kPrimaryColor, size: kTabIconSize),
          ),
          backgroundColor: kBackgroundColor,
          body: Container(
            alignment: Alignment.center,
            child: FutureBuilder<dynamic>(
                future: widget.query,
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    if (snapshot.data == null) {
                      return Text("Error getting Information");
                    } else {
                      if (widget.type == 0) {
                        return SearchResultsListWidget(
                          searchResultsList:
                              snapshot.data.similarMovieResultsList,
                          type: widget.type,
                        );
                      } else {
                        return SearchResultsListWidget(
                          searchResultsList: snapshot.data.similarTVResultsList,
                          type: widget.type,
                        );
                      }
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          )),
    );
  }
}

import 'package:fap_grp7/services/themoviedb_network.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';

import 'components/search_results_list_widget.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({Key? key}) : super(key: key);

  @override
  _SearchPageScreenState createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  Future<dynamic>? _query;
  var _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            title: Container(
              width: 250,
              height: 30,
              child: TextField(
                controller: _textFieldController,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                decoration: kTextFieldInputDecoration,
                onSubmitted: (value) {
                  _textFieldController.clear();
                  setState(() {
                    _query = TheMovieDBModel().getSearchInfo(value);
                  });
                },
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder<dynamic>(
                    future: _query,
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasData) {
                        if (snapshot.data == null) {
                          return Text("Error getting Information");
                        } else {
                          return SearchResultsListWidget(
                              searchResultsList:
                                  snapshot.data.searchResultsList);
                        }
                      } else {
                        return Container(
                            height: 500,
                            child: Center(
                              child: Text('Search Results'),
                            ));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

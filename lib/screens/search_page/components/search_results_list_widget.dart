import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';
import 'package:intl/intl.dart';

import 'package:fap_grp7/widgets/info_card_widget.dart';

class SearchResultsListWidget extends StatefulWidget {
  const SearchResultsListWidget({Key? key, this.searchResultsList, this.type})
      : super(key: key);

  final searchResultsList;
  final type;

  @override
  _SearchResultsListWidgetState createState() =>
      _SearchResultsListWidgetState();
}

class _SearchResultsListWidgetState extends State<SearchResultsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
          itemCount: widget.searchResultsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                kGoToInfoScreen(context, widget.searchResultsList[index].id, widget.searchResultsList[index].type);
              },
              child: InfoCardWidget(info: widget.searchResultsList[index],)
            );
          }),
    );
  }
}


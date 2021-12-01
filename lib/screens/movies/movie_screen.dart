import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';

import 'tabs/in_theaters.dart';
import 'tabs/coming_soon.dart';
import 'tabs/box_office.dart';

import 'package:fap_grp7/models/genre_list_main.dart';
import 'package:fap_grp7/models/genre.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  var mainGenreList = MainGenreList().getMainGenreList() as List<Genre>;
  var selectedGenres;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  kGoToSearchScreen(context);
                },
                icon: Icon(Icons.search))
          ],
          // bottom:
          title: kAppBarTitle,
          centerTitle: true,
        ),
        backgroundColor: kBackgroundColor,
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFF141E61),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.amberAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2,
            labelStyle: kTabStyle,
            unselectedLabelStyle: kTabUnselectedStyle,
            enableFeedback: false,
            //isScrollable: true,
            //indicator: Decoration(),
            tabs: const <Widget>[
              Tab(
                  icon: Icon(
                    Icons.movie_creation,
                    size: kTabIconSize,
                  ),
                  height: kTabHeight,
                  text: 'In Theaters'),
              Tab(
                  icon: Icon(
                    Icons.local_movies,
                    size: kTabIconSize,
                  ),
                  height: kTabHeight,
                  text: 'Box Office'),
              Tab(
                icon: Icon(Icons.calendar_today, size: kTabIconSize),
                height: kTabHeight,
                text: 'Coming Soon',
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  InTheaters(),
                  BoxOffice(),
                  ComingSoon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

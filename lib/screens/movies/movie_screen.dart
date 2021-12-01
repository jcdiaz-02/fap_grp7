import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';

import 'tabs/movies_now_playing.dart';
import 'tabs/movies_upcoming.dart';




class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          actions: [IconButton(onPressed: () {kGoToSearchScreen(context);}, icon: Icon(Icons.search))],
          // bottom:
          title: kAppBarTitle2,
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
                children:  <Widget>[
                  MoviesNowPlaying(),
                  MoviesUpcoming(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

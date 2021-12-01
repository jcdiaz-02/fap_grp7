import 'package:fap_grp7/constants.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/widgets/navigation_drawer_widget.dart';

import 'package:fap_grp7/screens/home/tabs/movies/trending_movies_widget.dart';
import 'package:fap_grp7/screens/home/tabs/onTV//trending_on_tv_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                kGoToSearchScreen(context);
              },
              icon: Icon(Icons.search))
        ],
        toolbarHeight: 50,
        elevation: 0,
        title: const Text(
          'flixHub',
          style: TextStyle(color: kPrimaryColor),
        ),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(color: kPrimaryColor, size: kTabIconSize),
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //home tab for movies and on tv
          Container(
            width: 300,
            child: TabBar(
              indicatorColor: Colors.transparent,
              labelStyle: kHomeTabStyle,
              labelColor: kPrimaryColor,
              unselectedLabelStyle: kHomeUnselectedTabStyle,
              enableFeedback: false,
              controller: _tabController,
              tabs: const <Widget>[
                Tab(height: kHomeTabHeight, text: 'Movies'),
                Tab(height: kHomeTabHeight, text: 'On Tv'),
              ],
            ),
          ),
          SizedBox(height: 10),
          //tab bar view
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: const <Widget>[TrendingMovies(), TrendingOnTvs()]),
          )
        ],
      ),
    ));
  }
}

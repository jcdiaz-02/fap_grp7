import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';

import 'tabs/in_theaters.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                icon: Icon(
                    Icons.calendar_today,
                    size: kTabIconSize
                ),
                height: kTabHeight,
                text: 'Coming Soon',
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          leading: const Icon(
            Icons.menu,
            size: 30,
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          // bottom:
          title: const Text('MovQuiz'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  InTheaters(),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

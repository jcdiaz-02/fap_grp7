import 'package:fap_grp7/screens/on_tv/tabs/on_tv_on_air.dart';
import 'package:fap_grp7/screens/on_tv/tabs/on_tv_popular.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fap_grp7/constants.dart';

class OnTvScreen extends StatefulWidget {
  const OnTvScreen({Key? key}) : super(key: key);

  @override
  _OnTvScreenState createState() => _OnTvScreenState();
}

class _OnTvScreenState extends State<OnTvScreen> with TickerProviderStateMixin {
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
            tabs: const <Widget>[
              Tab(
                  icon: Icon(
                    Icons.movie_creation,
                    size: kTabIconSize,
                  ),
                  height: kTabHeight,
                  text: 'On Air'),
              Tab(
                icon: Icon(Icons.whatshot, size: kTabIconSize),
                height: kTabHeight,
                text: 'Popular Shows',
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
                  OnTvOnAir(),
                  OnTvPopular()
                  //MoviesUpcoming(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

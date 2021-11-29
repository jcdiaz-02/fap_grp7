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

class _MovieScreenState extends State<MovieScreen> with TickerProviderStateMixin {
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
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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
            Container(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainGenreList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          mainGenreList[index].toggleActive();
                          selectedGenres = mainGenreList
                              .where((element) => element.active == true);
                          selectedGenres.forEach((element) {
                            print(element.title);
                          });
                          //print(mainGenreList[index].active);
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: mainGenreList[index].active == true
                                  ? kSecondaryColor
                                  : kBackgroundColor,
                              border:
                                  Border.all(width: 1.5, color: kPrimaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          alignment: Alignment.center,
                          width: 100,
                          child: Text("${mainGenreList[index].title}",
                              style: TextStyle(
                                color: mainGenreList[index].active == true
                                    ? Colors.white
                                    : Colors.black,
                              ))),
                    );
                  }),
            ),
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

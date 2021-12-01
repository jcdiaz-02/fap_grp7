import 'package:flutter/material.dart';
import '../components/on_tv_list.dart';
import 'package:fap_grp7/services/themoviedb_network.dart';

class OnTvPopular extends StatefulWidget {
  const OnTvPopular({Key? key}) : super(key: key);

  @override
  _OnTvPopularState createState() => _OnTvPopularState();
}

class _OnTvPopularState extends State<OnTvPopular>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: TheMovieDBModel().getOnTvPopular(),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          //print('the snapshot data:');
          if (snapshot.data == null) {
            return Text("Error getting Tv Shows");
          } else {
            return OnTvList(listMovies: snapshot.data.onTvList,  );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  }
}

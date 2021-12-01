import 'package:flutter/material.dart';
import '../components/on_tv_list.dart';
import 'package:fap_grp7/services/themoviedb_network.dart';

class OnTvOnAir extends StatefulWidget {
  const OnTvOnAir({Key? key}) : super(key: key);

  @override
  _OnTvOnAirState createState() => _OnTvOnAirState();
}

class _OnTvOnAirState extends State<OnTvOnAir>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: TheMovieDBModel().getOnTvOnAir(),
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

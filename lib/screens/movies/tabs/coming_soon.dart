import 'package:flutter/material.dart';
import '../components/movie_list_3.dart';
import 'package:fap_grp7/services/movie_network.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: MovieModel().getComingSoon(),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          //print('the snapshot data:');
          if (snapshot.data == null) {
            return Text("Error getting Movies");
          } else {
            return MovieList3(listComingSoon: snapshot.data.listComingSoon,);
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );;
  }
}

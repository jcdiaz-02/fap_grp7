import 'package:flutter/material.dart';
import '../components/movie_list_2.dart';
import 'package:fap_grp7/services/movie_network.dart';

class InTheaters extends StatefulWidget {
  const InTheaters({Key? key}) : super(key: key);

  @override
  _InTheatersState createState() => _InTheatersState();
}

class _InTheatersState extends State<InTheaters>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: MovieModel().getBoxOffice(),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          //print('the snapshot data:');
          if (snapshot.data == null) {
            return Text("Error getting Movies");
          } else {
            return MovieList2(listBoxOffice: snapshot.data.listBoxOffice,);
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  }
}

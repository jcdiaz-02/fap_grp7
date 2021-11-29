import 'package:flutter/material.dart';
import '../components/movie_list_2.dart';
import 'package:fap_grp7/services/movie_network.dart';

class BoxOffice extends StatefulWidget {
  const BoxOffice({Key? key}) : super(key: key);

  @override
  _BoxOfficeState createState() => _BoxOfficeState();
}

class _BoxOfficeState extends State<BoxOffice>{
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

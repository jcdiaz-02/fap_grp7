class InTheaters {
  final String? id;
  final String? title;
  final String? year;
  final String? image;
  final String? releaseState;
  final String? plot;

  InTheaters({this.id, this.title, this.year, this.image, this.releaseState, this.plot});

  factory InTheaters.fromJson(Map<String, dynamic> json) {
    //print(json);
    return InTheaters(
        id: json['id'],
        title: json['title'],
        year:  json['year'],
        image: json['image'],
        plot: json['plot'],
        releaseState: json['releaseState']
    );
  }

}
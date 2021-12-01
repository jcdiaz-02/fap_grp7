
class BoxOffice {
  final String? id;
  final String? rank;
  final String? title;
  final String? image;
  final String? weeks;


  BoxOffice({this.id, this.rank, this.title, this.image, this.weeks,});


  factory BoxOffice.fromJson(Map<String, dynamic> json) {
    return BoxOffice(
        id: json['id'],
        rank:  json['rank'],
        title: json['title'],
        image: json['image'],
        weeks: json['weeks'],
    );
  }

}
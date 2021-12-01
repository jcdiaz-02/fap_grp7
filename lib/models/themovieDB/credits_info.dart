class Cast{
  final int? id;
  final String? name;
  final String? character;
  final String? profilePath;

  Cast({this.id, this.name, this.character, this.profilePath});

  factory Cast.fromJson(Map<String, dynamic> json){
    return Cast(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path']
    );
  }
}

class Crew{
  final int? id;
  final String? name;
  final String? job;
  final String? profilePath;

  Crew({this.id, this.name, this.job, this.profilePath});

  factory Crew.fromJson(Map<String, dynamic> json){
    return Crew(
        id: json['id'],
        name: json['name'],
        job: json['job'],
        profilePath: json['profile_path']
    );
  }
}
class Genre {
  final String? title;
  bool active;

  Genre( this.title, {this.active = false});

  void toggleActive() {
    active = !active;
  }
}
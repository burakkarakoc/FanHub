class Post {
  String title;
  String description;
  // String date;
  String? photo;

  Post({
    required this.title,
    required this.description,
    // required this.date,
    this.photo,
  });

  @override
  String toString() => 'Post $title';
}

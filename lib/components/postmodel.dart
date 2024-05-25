class Post {
  final String imageUrl;

  Post({required this.imageUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      imageUrl: json['post'],
    );
  }
}
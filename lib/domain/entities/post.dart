class Post {
  final int id;
  final String title;
  final String content;
  bool isLiked;
  final String? urlToImage;
  final String? author;
  final String publishedAt;

  Post({
    required this.id,
    required this.title,
    required this.content,
    this.isLiked = false,
    this.urlToImage,
    this.author,
    required this.publishedAt,
  });
}

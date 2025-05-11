class Article {
  final int id;
  final int userId; // Added userId
  final String title;
  final String body;

  Article({required this.id, required this.userId, required this.title, required this.body});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      userId: json['userId'], // Parse userId
      title: json['title'],
      body: json['body'],
    );
  }
}
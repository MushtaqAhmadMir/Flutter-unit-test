class PostModel {
  final String? title;
  final int? id;
  final String? body;
  final int? userId;

  PostModel({
     this.title,
     this.id,
     this.body,
     this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'] as String,
      id: json['id'] as int,
      body: json['body'] as String,
      userId: json['userId'] as int,
    );
  }
}


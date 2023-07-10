import 'package:danfossapp/models/comment_model.dart';

class PostModelItem {
  late num id;
  late String name;
  final String title;
  final String message;
  late List<CommentModelItem> comments;
  late DateTime creationDate;

  PostModelItem({
    this.id = 0,
    this.comments = const [],
    required this.message,
    this.name = '',
    required this.title,
    DateTime? creationDate,
  }) : creationDate = creationDate ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'message': message,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'created_at': creationDate.toIso8601String(),
    };
  }

  factory PostModelItem.fromJson(Map<String, dynamic> json) {
    var commentList = json['comments'] as List<dynamic>;
    List<CommentModelItem> comments = commentList
        .map((commentJson) => CommentModelItem.fromJson(commentJson))
        .toList();
    return PostModelItem(
      id: json['id'],
      comments: comments,
      message: json['message'],
      title: json['title'],
      creationDate: DateTime.parse(json['created_at']),
    );
  }
}

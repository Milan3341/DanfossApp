class CommentModelItem {
  final String message;
  late String name;

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': name,
    };
  }

  CommentModelItem({required this.message, this.name = ''});
  factory CommentModelItem.fromJson(Map<String, dynamic> json) {
    return CommentModelItem(message: json['message'], name: json['user']);
  }
}

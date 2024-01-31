import 'package:postbloc_app/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel(
      {required super.title,
      required super.body,
      required super.id,
      required super.userId})
      : super();

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        title: json['title'],
        body: json['body'],
        id: json['id'],
        userId: json['userId']);
  }
}

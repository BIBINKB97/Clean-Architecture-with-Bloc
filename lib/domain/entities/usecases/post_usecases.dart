import 'package:postbloc_app/domain/entities/post_entity.dart';

class PostUsecases {
  Future<List<PostEntity>> getPostFormDataSource() async {
    List<PostEntity> allPosts = await posts.cast<PostEntity>();

    return allPosts;
  }
}

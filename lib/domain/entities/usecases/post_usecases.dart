import 'package:postbloc_app/data/repositories/post_repo_impl.dart';
import 'package:postbloc_app/domain/entities/post_entity.dart';
import 'package:postbloc_app/domain/entities/repositories/post_repo.dart';

class PostUseCases {
  PostRepo postRepo = PostRepoImpl();

  Future<List<PostEntity>> getPostFormDataSource() async {
    final posts = await postRepo.getPostFromDataSource();
    return posts;
  }
}

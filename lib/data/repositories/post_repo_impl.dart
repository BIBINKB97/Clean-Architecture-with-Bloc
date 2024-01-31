import 'package:postbloc_app/data/datasource/post_remote_datasource.dart';
import 'package:postbloc_app/domain/entities/post_entity.dart';
import 'package:postbloc_app/domain/entities/repositories/post_repo.dart';

class PostRepoImpl implements PostRepo {
  PostRemoteDataSource postRemoteDataSource = PostRemoteDataSourceImpl();
  @override
  Future<List<PostEntity>> getPostFromDataSource() async {
    final posts = await postRemoteDataSource.getPostFromApi();
    return posts;
    
  }
}

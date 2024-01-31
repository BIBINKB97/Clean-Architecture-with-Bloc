import 'dart:convert';

import 'package:postbloc_app/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPostFromApi();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final client = http.Client();

  @override
  Future<List<PostModel>> getPostFromApi() async {
    try {
      final response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          headers: {'content-Type': 'application/json'});
      if (response.statusCode == 200) {
        print(response);

        final List<dynamic> responseBody = jsonDecode(response.body);

        final List<PostModel> posts =
            responseBody.map((json) => PostModel.fromJson(json)).toList();

        return posts;
      } else {
        throw Exception("failed to load posts");
      }
    } catch (e) {
              throw Exception("failed to load posts");

    }
  }
}

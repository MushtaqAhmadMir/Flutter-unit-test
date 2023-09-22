import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'dart:convert'; // Add this import for JSON decoding
import 'package:unit_test_flutter/domain/models/post_model.dart';

abstract class PostService {
  Future<List<PostModel>> getPosts();
}

@Injectable(as: PostService)
class PostServiceImplementation extends PostService {
  final http.Client client;
  PostServiceImplementation({required this.client});
  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      final List<PostModel> posts = data
          .map((postJson) =>
              PostModel.fromJson(postJson as Map<String, dynamic>))
          .toList();

      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

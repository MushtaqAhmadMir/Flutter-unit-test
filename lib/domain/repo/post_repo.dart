import 'package:injectable/injectable.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';

abstract class PostRepo {
  Future<List<PostModel>> getPosts();
}

import 'package:injectable/injectable.dart';
import 'package:unit_test_flutter/data/service/post_service.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';
import 'package:unit_test_flutter/domain/repo/post_repo.dart';
@Injectable(as: PostRepo)
class PostRepoImpl extends PostRepo {
  final PostService postService;

  PostRepoImpl({required this.postService});
  @override
  Future<List<PostModel>> getPosts() {
    return postService.getPosts();
  }
}

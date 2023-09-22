import 'package:injectable/injectable.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';
import 'package:unit_test_flutter/domain/repo/post_repo.dart';
@injectable
class PostsUseCase {
  final PostRepo postRepo;

  PostsUseCase({required this.postRepo});

  Future<List<PostModel>> execute() {
    return postRepo.getPosts();
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_flutter/data/service/post_service.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';
import 'package:unit_test_flutter/domain/repo/post_repo.dart';
import 'package:unit_test_flutter/data/repo/post_repo_impl.dart';

class MockPostService extends Mock implements PostService {}

void main() {
  group('PostRepoImpl', () {
    late PostRepoImpl postRepo;
    late MockPostService mockPostService;

    setUp(() {
      mockPostService = MockPostService();
      postRepo = PostRepoImpl(postService: mockPostService);
    });

    test('getPosts delegates to PostService', () async {
      // Define a sample list of PostModel
      final List<PostModel> mockPosts = [
        PostModel(userId: 1, id: 1, title: 'Test Title 1', body: 'Test Body 1'),
        PostModel(userId: 2, id: 2, title: 'Test Title 2', body: 'Test Body 2'),
      ];

      // Mock the getPosts method of PostService to return the sample data
      when(()=>mockPostService.getPosts()).thenAnswer((_) async => mockPosts);

      // Call the getPosts method of PostRepoImpl
      final result = await postRepo.getPosts();

      // Verify that PostService.getPosts was called
      verify(()=>mockPostService.getPosts()).called(1);

      // Verify that the result matches the mocked data
      expect(result, mockPosts);
    });
  });
}

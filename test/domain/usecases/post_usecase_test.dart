import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';
import 'package:unit_test_flutter/domain/repo/post_repo.dart';
import 'package:unit_test_flutter/domain/usecases/post_usecase.dart';

class MockPostRepo extends Mock implements PostRepo {}

void main() {
  group('PostsUseCase', () {
    late PostsUseCase postsUseCase;
    late MockPostRepo mockPostRepo;

    setUp(() {
      mockPostRepo = MockPostRepo();
      postsUseCase = PostsUseCase(postRepo: mockPostRepo);
    });

    test('execute delegates to PostRepo', () async {
      // Define a sample list of PostModel
      final List<PostModel> mockPosts = [
        PostModel(userId: 1, id: 1, title: 'Test Title 1', body: 'Test Body 1'),
        PostModel(userId: 2, id: 2, title: 'Test Title 2', body: 'Test Body 2'),
      ];

      // Mock the getPosts method of PostRepo to return the sample data
      when(()=>mockPostRepo.getPosts()).thenAnswer((_) async => mockPosts);

      // Call the execute method of PostsUseCase
      final result = await postsUseCase.execute();

      // Verify that PostRepo.getPosts was called
      verify(()=>mockPostRepo.getPosts());

      // Verify that the result matches the mocked data
      expect(result, mockPosts);
    });
  });
}

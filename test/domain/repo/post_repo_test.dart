import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';
import 'package:unit_test_flutter/domain/repo/post_repo.dart';

class MockPostRepo extends Mock implements PostRepo {}

void main() {
  group('PostRepo', () {
    late PostRepo postRepo;

    setUp(() {
      postRepo = MockPostRepo();
    });

    test('getPosts is called and returns posts', () async {
      // Define a sample list of PostModel
      final List<PostModel> mockPosts = [
        PostModel(userId: 1, id: 1, title: 'Test Title 1', body: 'Test Body 1'),
        PostModel(userId: 2, id: 2, title: 'Test Title 2', body: 'Test Body 2'),
      ];

      // Mock the getPosts method of PostRepo to return the sample data
      when(() => postRepo.getPosts()).thenAnswer((_) async => mockPosts);

      // Call the getPosts method
      final result = await postRepo.getPosts();

      // Verify that getPosts was called
      verify(() => postRepo.getPosts());

      // Verify that the result matches the mocked data
      expect(result, mockPosts);
    });
  });
}

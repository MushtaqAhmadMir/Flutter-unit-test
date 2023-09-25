import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';
import 'package:unit_test_flutter/domain/usecases/post_usecase.dart';
import 'package:unit_test_flutter/presentation/post_screen/cubit/post_cubit.dart';

class MockPostUseCase extends Mock implements PostsUseCase {}

void main() {
  late PostsUseCase mockPostUsecase;

  setUp(() {
    mockPostUsecase = MockPostUseCase();
  });
  group('Post Cubit Tests', () {
    final List<PostModel> posts = [
      PostModel(id: 1, title: 'Post 1'),
      PostModel(id: 2, title: 'Post 2'),
    ];
    blocTest(
      'Test the initial values',
      build: () => PostCubit(getPostsUseCase: mockPostUsecase),
      expect: () => const <PostState>[],
    );
    blocTest<PostCubit, PostState>(
      'Test the loading state and posts',
      build: () {
        when(() => mockPostUsecase.execute()).thenAnswer((_) async => posts);
        return PostCubit(getPostsUseCase: mockPostUsecase);
      },
      wait: const Duration(seconds: 3),
      act: (cubit) async => cubit.fetchPosts(),
      expect: () => [
        // The first emitted state should have loading set to true
        const PostState.initial(loading: true),

        // The second emitted state should have loading set to false and data as a non-empty List<PostModel>
        PostState.initial(
          loading: false,
          data: posts,
          error: false,
        ),
      ],
    );
    blocTest<PostCubit, PostState>(
      'Throw Error if some went wrong',
      build: () {
        when(() => mockPostUsecase.execute())
            .thenThrow((_) async => Exception('error'));
        return PostCubit(getPostsUseCase: mockPostUsecase);
      },
      act: (cubit) async => cubit.fetchPosts(),
      expect: () => [
        // The first emitted state should have loading set to true
        const PostState.initial(loading: true),

        // The second emitted state should have loading set to false and data as a non-empty List<PostModel>
        const PostState.initial(
          loading: false,
          data: [],
          error: true,
        ),
      ],
    );
  });
}

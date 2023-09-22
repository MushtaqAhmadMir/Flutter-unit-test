import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_flutter/data/service/post_service.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late PostServiceImplementation postService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    postService = PostServiceImplementation(client: mockClient);
  });

  group('Post service Implementation', () {
    test('Post service should return list of posts', () async{
      // Define a sample JSON response
      const jsonResponse =
          '[{"userId": 1, "id": 1, "title": "Test Title", "body": "Test Body"}]';
      when(() => mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
          .thenAnswer((_) => Future.value(http.Response(jsonResponse, 200)));

      final result = await postService.getPosts();

      expect(result,isA<List<PostModel>>());
    });
  });
}

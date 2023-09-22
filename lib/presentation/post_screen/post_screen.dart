import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unit_test_flutter/common/injection.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';
import 'package:unit_test_flutter/presentation/post_screen/cubit/post_cubit.dart';

class PostListScreen extends StatelessWidget {
  PostListScreen({super.key});
  final cubit = getIt<PostCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.fetchPosts();
        },
        child: const Icon(Icons.get_app),
      ),
      body: BlocProvider(
        create: (context) {
          return cubit;
        },
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            final List<PostModel> posts = state.data;
            return Visibility(
              visible: !state.loading,
              replacement: const Center(child: CircularProgressIndicator()),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${posts[index].title}'),
                    subtitle: Text('${posts[index].body}'),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

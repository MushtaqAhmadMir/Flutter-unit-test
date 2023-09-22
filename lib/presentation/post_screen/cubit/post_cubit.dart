import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:unit_test_flutter/domain/models/post_model.dart';
import 'package:unit_test_flutter/domain/usecases/post_usecase.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

@Injectable()
class PostCubit extends Cubit<PostState> {
  final PostsUseCase getPostsUseCase;
  PostCubit({required this.getPostsUseCase}) : super(const PostState.initial());

  void fetchPosts() async {
    try {
      emit(state.copyWith(loading: true));
      final posts = await getPostsUseCase.execute();

      // Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(data: posts, loading: false));
    } catch (e) {
      emit(state.copyWith(error: true,loading: false));
    }
  }
}

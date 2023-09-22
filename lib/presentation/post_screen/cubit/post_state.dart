part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial(
      {@Default(false) bool loading,
      @Default(<List<PostModel>>[]) data,
      @Default(false) bool error}) = _Initial;
}

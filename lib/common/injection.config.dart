// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repo/post_repo_impl.dart' as _i6;
import '../data/service/post_service.dart' as _i4;
import '../domain/repo/post_repo.dart' as _i5;
import '../domain/usecases/post_usecase.dart' as _i7;
import '../presentation/post_screen/cubit/post_cubit.dart' as _i8;
import 'injection.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.singleton<_i3.Client>(injectableModule.httpClient);
    gh.factory<_i4.PostService>(
        () => _i4.PostServiceImplementation(client: gh<_i3.Client>()));
    gh.factory<_i5.PostRepo>(
        () => _i6.PostRepoImpl(postService: gh<_i4.PostService>()));
    gh.factory<_i7.PostsUseCase>(
        () => _i7.PostsUseCase(postRepo: gh<_i5.PostRepo>()));
    gh.factory<_i8.PostCubit>(
        () => _i8.PostCubit(getPostsUseCase: gh<_i7.PostsUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i9.InjectableModule {}

part of 'song_repository.dart';

String _$songRepositoryHash() => r'0b7ceb00473c53b0d9f23b89063ecb96a4d999dc';

@ProviderFor(songRepository)
final songRepositoryProvider = AutoDisposeProvider<SongRepository>.internal(
  songRepository,
  name: r'songRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$songRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
typedef SongRepositoryRef = AutoDisposeProviderRef<SongRepository>;

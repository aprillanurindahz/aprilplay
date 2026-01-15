import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/song_model.dart';
import '../../data/repositories/song_repository.dart';

part 'song_provider.g.dart';

@riverpod
Future<List<SongModel>> songs(SongsRef ref) {
  final repository = ref.watch(songRepositoryProvider);

  return repository.getSongs();
}

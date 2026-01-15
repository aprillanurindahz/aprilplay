import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/song_model.dart';

part 'song_repository.g.dart';

@riverpod
SongRepository songRepository(SongRepositoryRef ref) {
  return SongRepository();
}

class SongRepository {
  final _client = Supabase.instance.client;

  Future<List<SongModel>> getSongs() async {
    try {
      final response =
          await _client.from('songs').select().order('id', ascending: true);

      final List<dynamic> data = response;
      return data.map((json) => SongModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Gagal mengambil lagu: $e');
    }
  }
}

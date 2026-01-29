import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/song_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'song_repository.g.dart';

@riverpod
SongRepository songRepository(Ref ref) {
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

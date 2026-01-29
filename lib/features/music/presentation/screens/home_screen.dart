import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../main.dart';
import '../providers/song_provider.dart';
// Import 2 file widget baru
import '../widgets/add_song_sheet.dart';
import '../widgets/song_tile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentlyPlayingUrl;
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playMusic(String url) async {
    try {
      if (_currentlyPlayingUrl == url && _isPlaying) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        await _audioPlayer.stop();
        await _audioPlayer.play(UrlSource(url));
        setState(() {
          _currentlyPlayingUrl = url;
          _isPlaying = true;
        });
      }
    } catch (e) {
      if (mounted)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Future<void> _deleteSong(int songId, String title) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        title: const Text("Hapus Lagu?", style: TextStyle(color: Colors.white)),
        content: Text("'$title' akan dihapus.",
            style: const TextStyle(color: Colors.grey)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Batal")),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("HAPUS", style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      await Supabase.instance.client.from('songs').delete().eq('id', songId);
      ref.invalidate(songsProvider);
    }
  }

  void _showAddSongSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => const AddSongSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final songsAsync = ref.watch(songsProvider);

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 65,
          child:
              Image.asset('assets/images/logo_april.png', fit: BoxFit.contain),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddSongSheet,
        backgroundColor: MyApp.electricYellow,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: songsAsync.when(
        data: (songs) {
          if (songs.isEmpty)
            return const Center(child: Text("Belum ada lagu."));
          return ListView.builder(
            itemCount: songs.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemBuilder: (context, index) {
              final song = songs[index];
              return SongTile(
                song: song,
                isPlaying: (_currentlyPlayingUrl == song.songUrl && _isPlaying),
                onPlay: () {
                  if (song.songUrl != null) _playMusic(song.songUrl!);
                },
                onDelete: () {
                  if (song.id != null) _deleteSong(song.id!, song.title);
                },
              );
            },
          );
        },
        loading: () => const Center(
            child: CircularProgressIndicator(color: MyApp.electricYellow)),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/song_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Minta data ke Provider (Si Pelayan)
    final songsAsync = ref.watch(songsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AprilPlay 🎵',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: songsAsync.when(
        // A. JIKA DATA ADA (SUKSES)
        data: (songs) {
          if (songs.isEmpty) {
            return const Center(child: Text("Belum ada lagu di Supabase."));
          }
          return ListView.builder(
            itemCount: songs.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final song = songs[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: song.coverUrl != null
                        ? NetworkImage(song.coverUrl!)
                        : null,
                    child: song.coverUrl == null
                        ? const Icon(Icons.music_note)
                        : null,
                  ),
                  title: Text(song.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(song.artist),
                  trailing: const Icon(Icons.play_circle_fill,
                      color: Colors.deepPurple, size: 32),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Memutar: ${song.title}")));
                  },
                ),
              );
            },
          );
        },
        // B. JIKA SEDANG LOADING
        loading: () => const Center(child: CircularProgressIndicator()),
        // C. JIKA ERROR
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

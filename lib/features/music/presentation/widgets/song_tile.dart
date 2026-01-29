import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../data/models/song_model.dart'; // Sesuaikan import model Anda

class SongTile extends StatelessWidget {
  final SongModel song;
  final bool isPlaying;
  final VoidCallback onPlay;
  final VoidCallback onDelete;

  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onPlay,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border:
            const Border(left: BorderSide(color: MyApp.freshGreen, width: 4)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 5,
              offset: const Offset(0, 3)),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 60,
            height: 60,
            color: Colors.grey[800],
            child: song.coverUrl != null
                ? Image.network(song.coverUrl!, fit: BoxFit.cover)
                : const Icon(Icons.music_note, color: MyApp.electricYellow),
          ),
        ),
        title: Text(song.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
        subtitle: Text(song.artist,
            style: TextStyle(color: MyApp.freshGreen.withValues(alpha: 0.7))),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.grey),
              onPressed: onDelete,
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: MyApp.electricYellow.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: MyApp.electricYellow,
                ),
                onPressed: onPlay,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

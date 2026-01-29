import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../main.dart';
import '../providers/song_provider.dart';

class AddSongSheet extends ConsumerStatefulWidget {
  const AddSongSheet({super.key});

  @override
  ConsumerState<AddSongSheet> createState() => _AddSongSheetState();
}

class _AddSongSheetState extends ConsumerState<AddSongSheet> {
  final _titleController = TextEditingController();
  final _artistController = TextEditingController();
  File? _selectedAudioFile;
  File? _selectedCoverFile;
  bool _isUploading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    super.dispose();
  }

  Future<void> _pickFile(FileType type, Function(File) onPicked) async {
    final result = await FilePicker.platform.pickFiles(type: type);
    if (result != null) onPicked(File(result.files.single.path!));
  }

  Future<String?> _uploadFile(File file, String folder) async {
    try {
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';
      final path = '$folder/$fileName';
      await Supabase.instance.client.storage
          .from('music_files')
          .upload(path, file);
      return Supabase.instance.client.storage
          .from('music_files')
          .getPublicUrl(path);
    } catch (_) {
      return null;
    }
  }

  Future<void> _uploadSong() async {
    if (_titleController.text.isEmpty ||
        _artistController.text.isEmpty ||
        _selectedAudioFile == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Data wajib diisi!")));
      return;
    }

    setState(() => _isUploading = true);

    // Upload Paralel biar cepat
    final audioUrl = await _uploadFile(_selectedAudioFile!, 'songs');
    String? coverUrl;
    if (_selectedCoverFile != null) {
      coverUrl = await _uploadFile(_selectedCoverFile!, 'covers');
    }

    if (audioUrl != null) {
      await Supabase.instance.client.from('songs').insert({
        'title': _titleController.text,
        'artist': _artistController.text,
        'song_url': audioUrl,
        'cover_url': coverUrl,
      });
      ref.invalidate(songsProvider);
      if (mounted) Navigator.pop(context); // Tutup Sheet otomatis
    } else {
      if (mounted) {
        setState(() => _isUploading = false);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Gagal upload audio")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isUploading) {
      return Container(
        height: 200,
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: MyApp.electricYellow),
            SizedBox(height: 20),
            Text("Sedang Mengupload...", style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Upload Lagu Baru",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildTextField(_titleController, "Judul Lagu"),
          const SizedBox(height: 10),
          _buildTextField(_artistController, "Nama Artis"),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildFileButton(
                  "Audio",
                  _selectedAudioFile != null,
                  () => _pickFile(FileType.audio,
                      (f) => setState(() => _selectedAudioFile = f))),
              const SizedBox(width: 10),
              _buildFileButton(
                  "Cover",
                  _selectedCoverFile != null,
                  () => _pickFile(FileType.image,
                      (f) => setState(() => _selectedCoverFile = f))),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _uploadSong,
              style: ElevatedButton.styleFrom(
                backgroundColor: MyApp.electricYellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("UPLOAD SEKARANG",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF2A2A2A),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildFileButton(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(isSelected ? Icons.check : Icons.upload_file),
        label: Text(isSelected ? "Ready" : label),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? MyApp.freshGreen : const Color(0xFF2A2A2A),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

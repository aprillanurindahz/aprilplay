import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_model.freezed.dart';
part 'song_model.g.dart';

@freezed
abstract class SongModel with _$SongModel {
  const factory SongModel({
    int? id,
    required String title,
    required String artist,
    @JsonKey(name: 'song_url') required String songUrl,
    @JsonKey(name: 'cover_url') String? coverUrl,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);
}

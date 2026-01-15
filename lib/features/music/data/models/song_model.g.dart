// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongModel _$SongModelFromJson(Map<String, dynamic> json) => _SongModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      artist: json['artist'] as String,
      songUrl: json['song_url'] as String,
      coverUrl: json['cover_url'] as String?,
    );

Map<String, dynamic> _$SongModelToJson(_SongModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'song_url': instance.songUrl,
      'cover_url': instance.coverUrl,
    };

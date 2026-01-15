// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongModel {
  int? get id;
  String get title;
  String get artist;
  @JsonKey(name: 'song_url')
  String get songUrl;
  @JsonKey(name: 'cover_url')
  String? get coverUrl;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongModelCopyWith<SongModel> get copyWith =>
      _$SongModelCopyWithImpl<SongModel>(this as SongModel, _$identity);

  /// Serializes this SongModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.songUrl, songUrl) || other.songUrl == songUrl) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, artist, songUrl, coverUrl);

  @override
  String toString() {
    return 'SongModel(id: $id, title: $title, artist: $artist, songUrl: $songUrl, coverUrl: $coverUrl)';
  }
}

/// @nodoc
abstract mixin class $SongModelCopyWith<$Res> {
  factory $SongModelCopyWith(SongModel value, $Res Function(SongModel) _then) =
      _$SongModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String title,
      String artist,
      @JsonKey(name: 'song_url') String songUrl,
      @JsonKey(name: 'cover_url') String? coverUrl});
}

/// @nodoc
class _$SongModelCopyWithImpl<$Res> implements $SongModelCopyWith<$Res> {
  _$SongModelCopyWithImpl(this._self, this._then);

  final SongModel _self;
  final $Res Function(SongModel) _then;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? artist = null,
    Object? songUrl = null,
    Object? coverUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _self.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      songUrl: null == songUrl
          ? _self.songUrl
          : songUrl // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: freezed == coverUrl
          ? _self.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SongModel].
extension SongModelPatterns on SongModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SongModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SongModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SongModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int? id,
            String title,
            String artist,
            @JsonKey(name: 'song_url') String songUrl,
            @JsonKey(name: 'cover_url') String? coverUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongModel() when $default != null:
        return $default(
            _that.id, _that.title, _that.artist, _that.songUrl, _that.coverUrl);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int? id,
            String title,
            String artist,
            @JsonKey(name: 'song_url') String songUrl,
            @JsonKey(name: 'cover_url') String? coverUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongModel():
        return $default(
            _that.id, _that.title, _that.artist, _that.songUrl, _that.coverUrl);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int? id,
            String title,
            String artist,
            @JsonKey(name: 'song_url') String songUrl,
            @JsonKey(name: 'cover_url') String? coverUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongModel() when $default != null:
        return $default(
            _that.id, _that.title, _that.artist, _that.songUrl, _that.coverUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SongModel implements SongModel {
  const _SongModel(
      {this.id,
      required this.title,
      required this.artist,
      @JsonKey(name: 'song_url') required this.songUrl,
      @JsonKey(name: 'cover_url') this.coverUrl});
  factory _SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String artist;
  @override
  @JsonKey(name: 'song_url')
  final String songUrl;
  @override
  @JsonKey(name: 'cover_url')
  final String? coverUrl;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SongModelCopyWith<_SongModel> get copyWith =>
      __$SongModelCopyWithImpl<_SongModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SongModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SongModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.songUrl, songUrl) || other.songUrl == songUrl) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, artist, songUrl, coverUrl);

  @override
  String toString() {
    return 'SongModel(id: $id, title: $title, artist: $artist, songUrl: $songUrl, coverUrl: $coverUrl)';
  }
}

/// @nodoc
abstract mixin class _$SongModelCopyWith<$Res>
    implements $SongModelCopyWith<$Res> {
  factory _$SongModelCopyWith(
          _SongModel value, $Res Function(_SongModel) _then) =
      __$SongModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String artist,
      @JsonKey(name: 'song_url') String songUrl,
      @JsonKey(name: 'cover_url') String? coverUrl});
}

/// @nodoc
class __$SongModelCopyWithImpl<$Res> implements _$SongModelCopyWith<$Res> {
  __$SongModelCopyWithImpl(this._self, this._then);

  final _SongModel _self;
  final $Res Function(_SongModel) _then;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? artist = null,
    Object? songUrl = null,
    Object? coverUrl = freezed,
  }) {
    return _then(_SongModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _self.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      songUrl: null == songUrl
          ? _self.songUrl
          : songUrl // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: freezed == coverUrl
          ? _self.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PlayerEntity {
  String get steamId => throw _privateConstructorUsedError;
  String get profileUrl => throw _privateConstructorUsedError;
  String? get customUrl => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Create a copy of PlayerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerEntityCopyWith<PlayerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerEntityCopyWith<$Res> {
  factory $PlayerEntityCopyWith(
    PlayerEntity value,
    $Res Function(PlayerEntity) then,
  ) = _$PlayerEntityCopyWithImpl<$Res, PlayerEntity>;
  @useResult
  $Res call({
    String steamId,
    String profileUrl,
    String? customUrl,
    String displayName,
    String avatarUrl,
  });
}

/// @nodoc
class _$PlayerEntityCopyWithImpl<$Res, $Val extends PlayerEntity>
    implements $PlayerEntityCopyWith<$Res> {
  _$PlayerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steamId = null,
    Object? profileUrl = null,
    Object? customUrl = freezed,
    Object? displayName = null,
    Object? avatarUrl = null,
  }) {
    return _then(
      _value.copyWith(
            steamId: null == steamId
                ? _value.steamId
                : steamId // ignore: cast_nullable_to_non_nullable
                      as String,
            profileUrl: null == profileUrl
                ? _value.profileUrl
                : profileUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            customUrl: freezed == customUrl
                ? _value.customUrl
                : customUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: null == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerEntityImplCopyWith<$Res>
    implements $PlayerEntityCopyWith<$Res> {
  factory _$$PlayerEntityImplCopyWith(
    _$PlayerEntityImpl value,
    $Res Function(_$PlayerEntityImpl) then,
  ) = __$$PlayerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String steamId,
    String profileUrl,
    String? customUrl,
    String displayName,
    String avatarUrl,
  });
}

/// @nodoc
class __$$PlayerEntityImplCopyWithImpl<$Res>
    extends _$PlayerEntityCopyWithImpl<$Res, _$PlayerEntityImpl>
    implements _$$PlayerEntityImplCopyWith<$Res> {
  __$$PlayerEntityImplCopyWithImpl(
    _$PlayerEntityImpl _value,
    $Res Function(_$PlayerEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steamId = null,
    Object? profileUrl = null,
    Object? customUrl = freezed,
    Object? displayName = null,
    Object? avatarUrl = null,
  }) {
    return _then(
      _$PlayerEntityImpl(
        steamId: null == steamId
            ? _value.steamId
            : steamId // ignore: cast_nullable_to_non_nullable
                  as String,
        profileUrl: null == profileUrl
            ? _value.profileUrl
            : profileUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        customUrl: freezed == customUrl
            ? _value.customUrl
            : customUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: null == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PlayerEntityImpl implements _PlayerEntity {
  const _$PlayerEntityImpl({
    required this.steamId,
    required this.profileUrl,
    this.customUrl,
    required this.displayName,
    required this.avatarUrl,
  });

  @override
  final String steamId;
  @override
  final String profileUrl;
  @override
  final String? customUrl;
  @override
  final String displayName;
  @override
  final String avatarUrl;

  @override
  String toString() {
    return 'PlayerEntity(steamId: $steamId, profileUrl: $profileUrl, customUrl: $customUrl, displayName: $displayName, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEntityImpl &&
            (identical(other.steamId, steamId) || other.steamId == steamId) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.customUrl, customUrl) ||
                other.customUrl == customUrl) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    steamId,
    profileUrl,
    customUrl,
    displayName,
    avatarUrl,
  );

  /// Create a copy of PlayerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEntityImplCopyWith<_$PlayerEntityImpl> get copyWith =>
      __$$PlayerEntityImplCopyWithImpl<_$PlayerEntityImpl>(this, _$identity);
}

abstract class _PlayerEntity implements PlayerEntity {
  const factory _PlayerEntity({
    required final String steamId,
    required final String profileUrl,
    final String? customUrl,
    required final String displayName,
    required final String avatarUrl,
  }) = _$PlayerEntityImpl;

  @override
  String get steamId;
  @override
  String get profileUrl;
  @override
  String? get customUrl;
  @override
  String get displayName;
  @override
  String get avatarUrl;

  /// Create a copy of PlayerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerEntityImplCopyWith<_$PlayerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

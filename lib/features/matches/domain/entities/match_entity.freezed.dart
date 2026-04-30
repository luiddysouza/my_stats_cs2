// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MatchEntity {
  String get matchId => throw _privateConstructorUsedError;
  String get map => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  MatchResult get result => throw _privateConstructorUsedError;

  /// Create a copy of MatchEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchEntityCopyWith<MatchEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchEntityCopyWith<$Res> {
  factory $MatchEntityCopyWith(
    MatchEntity value,
    $Res Function(MatchEntity) then,
  ) = _$MatchEntityCopyWithImpl<$Res, MatchEntity>;
  @useResult
  $Res call({
    String matchId,
    String map,
    DateTime date,
    int durationMinutes,
    MatchResult result,
  });
}

/// @nodoc
class _$MatchEntityCopyWithImpl<$Res, $Val extends MatchEntity>
    implements $MatchEntityCopyWith<$Res> {
  _$MatchEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchId = null,
    Object? map = null,
    Object? date = null,
    Object? durationMinutes = null,
    Object? result = null,
  }) {
    return _then(
      _value.copyWith(
            matchId: null == matchId
                ? _value.matchId
                : matchId // ignore: cast_nullable_to_non_nullable
                      as String,
            map: null == map
                ? _value.map
                : map // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            durationMinutes: null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as MatchResult,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MatchEntityImplCopyWith<$Res>
    implements $MatchEntityCopyWith<$Res> {
  factory _$$MatchEntityImplCopyWith(
    _$MatchEntityImpl value,
    $Res Function(_$MatchEntityImpl) then,
  ) = __$$MatchEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String matchId,
    String map,
    DateTime date,
    int durationMinutes,
    MatchResult result,
  });
}

/// @nodoc
class __$$MatchEntityImplCopyWithImpl<$Res>
    extends _$MatchEntityCopyWithImpl<$Res, _$MatchEntityImpl>
    implements _$$MatchEntityImplCopyWith<$Res> {
  __$$MatchEntityImplCopyWithImpl(
    _$MatchEntityImpl _value,
    $Res Function(_$MatchEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchId = null,
    Object? map = null,
    Object? date = null,
    Object? durationMinutes = null,
    Object? result = null,
  }) {
    return _then(
      _$MatchEntityImpl(
        matchId: null == matchId
            ? _value.matchId
            : matchId // ignore: cast_nullable_to_non_nullable
                  as String,
        map: null == map
            ? _value.map
            : map // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        durationMinutes: null == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        result: null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as MatchResult,
      ),
    );
  }
}

/// @nodoc

class _$MatchEntityImpl implements _MatchEntity {
  const _$MatchEntityImpl({
    required this.matchId,
    required this.map,
    required this.date,
    required this.durationMinutes,
    required this.result,
  });

  @override
  final String matchId;
  @override
  final String map;
  @override
  final DateTime date;
  @override
  final int durationMinutes;
  @override
  final MatchResult result;

  @override
  String toString() {
    return 'MatchEntity(matchId: $matchId, map: $map, date: $date, durationMinutes: $durationMinutes, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchEntityImpl &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.map, map) || other.map == map) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, matchId, map, date, durationMinutes, result);

  /// Create a copy of MatchEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchEntityImplCopyWith<_$MatchEntityImpl> get copyWith =>
      __$$MatchEntityImplCopyWithImpl<_$MatchEntityImpl>(this, _$identity);
}

abstract class _MatchEntity implements MatchEntity {
  const factory _MatchEntity({
    required final String matchId,
    required final String map,
    required final DateTime date,
    required final int durationMinutes,
    required final MatchResult result,
  }) = _$MatchEntityImpl;

  @override
  String get matchId;
  @override
  String get map;
  @override
  DateTime get date;
  @override
  int get durationMinutes;
  @override
  MatchResult get result;

  /// Create a copy of MatchEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchEntityImplCopyWith<_$MatchEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

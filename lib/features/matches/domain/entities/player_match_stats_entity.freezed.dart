// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_match_stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PlayerMatchStatsEntity {
  PlayerEntity get player => throw _privateConstructorUsedError;
  int get kills => throw _privateConstructorUsedError;
  int get assists => throw _privateConstructorUsedError;
  int get deaths => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get headshots => throw _privateConstructorUsedError;
  int get mvpCount => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  String get team => throw _privateConstructorUsedError;

  /// Create a copy of PlayerMatchStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerMatchStatsEntityCopyWith<PlayerMatchStatsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerMatchStatsEntityCopyWith<$Res> {
  factory $PlayerMatchStatsEntityCopyWith(
    PlayerMatchStatsEntity value,
    $Res Function(PlayerMatchStatsEntity) then,
  ) = _$PlayerMatchStatsEntityCopyWithImpl<$Res, PlayerMatchStatsEntity>;
  @useResult
  $Res call({
    PlayerEntity player,
    int kills,
    int assists,
    int deaths,
    double rating,
    int headshots,
    int mvpCount,
    int score,
    String team,
  });

  $PlayerEntityCopyWith<$Res> get player;
}

/// @nodoc
class _$PlayerMatchStatsEntityCopyWithImpl<
  $Res,
  $Val extends PlayerMatchStatsEntity
>
    implements $PlayerMatchStatsEntityCopyWith<$Res> {
  _$PlayerMatchStatsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerMatchStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? kills = null,
    Object? assists = null,
    Object? deaths = null,
    Object? rating = null,
    Object? headshots = null,
    Object? mvpCount = null,
    Object? score = null,
    Object? team = null,
  }) {
    return _then(
      _value.copyWith(
            player: null == player
                ? _value.player
                : player // ignore: cast_nullable_to_non_nullable
                      as PlayerEntity,
            kills: null == kills
                ? _value.kills
                : kills // ignore: cast_nullable_to_non_nullable
                      as int,
            assists: null == assists
                ? _value.assists
                : assists // ignore: cast_nullable_to_non_nullable
                      as int,
            deaths: null == deaths
                ? _value.deaths
                : deaths // ignore: cast_nullable_to_non_nullable
                      as int,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            headshots: null == headshots
                ? _value.headshots
                : headshots // ignore: cast_nullable_to_non_nullable
                      as int,
            mvpCount: null == mvpCount
                ? _value.mvpCount
                : mvpCount // ignore: cast_nullable_to_non_nullable
                      as int,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as int,
            team: null == team
                ? _value.team
                : team // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of PlayerMatchStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerEntityCopyWith<$Res> get player {
    return $PlayerEntityCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerMatchStatsEntityImplCopyWith<$Res>
    implements $PlayerMatchStatsEntityCopyWith<$Res> {
  factory _$$PlayerMatchStatsEntityImplCopyWith(
    _$PlayerMatchStatsEntityImpl value,
    $Res Function(_$PlayerMatchStatsEntityImpl) then,
  ) = __$$PlayerMatchStatsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PlayerEntity player,
    int kills,
    int assists,
    int deaths,
    double rating,
    int headshots,
    int mvpCount,
    int score,
    String team,
  });

  @override
  $PlayerEntityCopyWith<$Res> get player;
}

/// @nodoc
class __$$PlayerMatchStatsEntityImplCopyWithImpl<$Res>
    extends
        _$PlayerMatchStatsEntityCopyWithImpl<$Res, _$PlayerMatchStatsEntityImpl>
    implements _$$PlayerMatchStatsEntityImplCopyWith<$Res> {
  __$$PlayerMatchStatsEntityImplCopyWithImpl(
    _$PlayerMatchStatsEntityImpl _value,
    $Res Function(_$PlayerMatchStatsEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerMatchStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? kills = null,
    Object? assists = null,
    Object? deaths = null,
    Object? rating = null,
    Object? headshots = null,
    Object? mvpCount = null,
    Object? score = null,
    Object? team = null,
  }) {
    return _then(
      _$PlayerMatchStatsEntityImpl(
        player: null == player
            ? _value.player
            : player // ignore: cast_nullable_to_non_nullable
                  as PlayerEntity,
        kills: null == kills
            ? _value.kills
            : kills // ignore: cast_nullable_to_non_nullable
                  as int,
        assists: null == assists
            ? _value.assists
            : assists // ignore: cast_nullable_to_non_nullable
                  as int,
        deaths: null == deaths
            ? _value.deaths
            : deaths // ignore: cast_nullable_to_non_nullable
                  as int,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        headshots: null == headshots
            ? _value.headshots
            : headshots // ignore: cast_nullable_to_non_nullable
                  as int,
        mvpCount: null == mvpCount
            ? _value.mvpCount
            : mvpCount // ignore: cast_nullable_to_non_nullable
                  as int,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        team: null == team
            ? _value.team
            : team // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PlayerMatchStatsEntityImpl implements _PlayerMatchStatsEntity {
  const _$PlayerMatchStatsEntityImpl({
    required this.player,
    required this.kills,
    required this.assists,
    required this.deaths,
    required this.rating,
    required this.headshots,
    required this.mvpCount,
    required this.score,
    required this.team,
  });

  @override
  final PlayerEntity player;
  @override
  final int kills;
  @override
  final int assists;
  @override
  final int deaths;
  @override
  final double rating;
  @override
  final int headshots;
  @override
  final int mvpCount;
  @override
  final int score;
  @override
  final String team;

  @override
  String toString() {
    return 'PlayerMatchStatsEntity(player: $player, kills: $kills, assists: $assists, deaths: $deaths, rating: $rating, headshots: $headshots, mvpCount: $mvpCount, score: $score, team: $team)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerMatchStatsEntityImpl &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.kills, kills) || other.kills == kills) &&
            (identical(other.assists, assists) || other.assists == assists) &&
            (identical(other.deaths, deaths) || other.deaths == deaths) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.headshots, headshots) ||
                other.headshots == headshots) &&
            (identical(other.mvpCount, mvpCount) ||
                other.mvpCount == mvpCount) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.team, team) || other.team == team));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    player,
    kills,
    assists,
    deaths,
    rating,
    headshots,
    mvpCount,
    score,
    team,
  );

  /// Create a copy of PlayerMatchStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerMatchStatsEntityImplCopyWith<_$PlayerMatchStatsEntityImpl>
  get copyWith =>
      __$$PlayerMatchStatsEntityImplCopyWithImpl<_$PlayerMatchStatsEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _PlayerMatchStatsEntity implements PlayerMatchStatsEntity {
  const factory _PlayerMatchStatsEntity({
    required final PlayerEntity player,
    required final int kills,
    required final int assists,
    required final int deaths,
    required final double rating,
    required final int headshots,
    required final int mvpCount,
    required final int score,
    required final String team,
  }) = _$PlayerMatchStatsEntityImpl;

  @override
  PlayerEntity get player;
  @override
  int get kills;
  @override
  int get assists;
  @override
  int get deaths;
  @override
  double get rating;
  @override
  int get headshots;
  @override
  int get mvpCount;
  @override
  int get score;
  @override
  String get team;

  /// Create a copy of PlayerMatchStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerMatchStatsEntityImplCopyWith<_$PlayerMatchStatsEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}

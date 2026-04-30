import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_entity.freezed.dart';

@freezed
class PlayerEntity with _$PlayerEntity {
  const factory PlayerEntity({
    required String steamId,
    required String profileUrl,
    String? customUrl,
    required String displayName,
    required String avatarUrl,
  }) = _PlayerEntity;
}

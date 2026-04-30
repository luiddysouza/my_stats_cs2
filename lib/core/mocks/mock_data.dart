import 'package:my_stats_cs2/core/constants/enums.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/match_entity.dart';
import 'package:my_stats_cs2/features/matches/domain/entities/player_match_stats_entity.dart';
import 'package:my_stats_cs2/features/search/domain/entities/player_entity.dart';

/// Mock data simulating the contract of a future CS2 stats API.
/// Structure matches exactly what the real API is expected to return.
/// When the real API is integrated, only the datasource layer changes.
class MockData {
  MockData._();

  // ---------------------------------------------------------------------------
  // Players
  // ---------------------------------------------------------------------------

  static const PlayerEntity searchedPlayer = PlayerEntity(
    steamId: '76561198012345678',
    profileUrl: 'https://steamcommunity.com/profiles/76561198012345678',
    customUrl: 'https://steamcommunity.com/id/player_one',
    displayName: 'Player One',
    avatarUrl:
        'https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg',
  );

  static const List<PlayerEntity> teamAPlayers = [
    searchedPlayer,
    PlayerEntity(
      steamId: '76561198087654321',
      profileUrl: 'https://steamcommunity.com/profiles/76561198087654321',
      displayName: 'Sniper Pro',
      avatarUrl: 'https://avatars.steamstatic.com/abc123_full.jpg',
    ),
    PlayerEntity(
      steamId: '76561198011111111',
      profileUrl: 'https://steamcommunity.com/profiles/76561198011111111',
      displayName: 'AimBot99',
      avatarUrl: 'https://avatars.steamstatic.com/def456_full.jpg',
    ),
    PlayerEntity(
      steamId: '76561198022222222',
      profileUrl: 'https://steamcommunity.com/profiles/76561198022222222',
      displayName: 'FlashKing',
      avatarUrl: 'https://avatars.steamstatic.com/ghi789_full.jpg',
    ),
    PlayerEntity(
      steamId: '76561198033333333',
      profileUrl: 'https://steamcommunity.com/profiles/76561198033333333',
      displayName: 'EntryFragger',
      avatarUrl: 'https://avatars.steamstatic.com/jkl012_full.jpg',
    ),
  ];

  static const List<PlayerEntity> teamBPlayers = [
    PlayerEntity(
      steamId: '76561198044444444',
      profileUrl: 'https://steamcommunity.com/profiles/76561198044444444',
      displayName: 'HeadShot',
      avatarUrl: 'https://avatars.steamstatic.com/mno345_full.jpg',
    ),
    PlayerEntity(
      steamId: '76561198055555555',
      profileUrl: 'https://steamcommunity.com/profiles/76561198055555555',
      displayName: 'AWPer',
      avatarUrl: 'https://avatars.steamstatic.com/pqr678_full.jpg',
    ),
    PlayerEntity(
      steamId: '76561198066666666',
      profileUrl: 'https://steamcommunity.com/profiles/76561198066666666',
      displayName: 'Lurker',
      avatarUrl: 'https://avatars.steamstatic.com/stu901_full.jpg',
    ),
    PlayerEntity(
      steamId: '76561198077777777',
      profileUrl: 'https://steamcommunity.com/profiles/76561198077777777',
      displayName: 'SprayControl',
      avatarUrl: 'https://avatars.steamstatic.com/vwx234_full.jpg',
    ),
    PlayerEntity(
      steamId: '76561198088888888',
      profileUrl: 'https://steamcommunity.com/profiles/76561198088888888',
      displayName: 'PeekMaster',
      avatarUrl: 'https://avatars.steamstatic.com/yza567_full.jpg',
    ),
  ];

  // ---------------------------------------------------------------------------
  // Matches (last 10)
  // ---------------------------------------------------------------------------

  static final List<MatchEntity> matches = [
    MatchEntity(
      matchId: 'match-001',
      map: 'de_dust2',
      date: DateTime(2026, 4, 30, 20, 0),
      durationMinutes: 32,
      result: MatchResult.win,
    ),
    MatchEntity(
      matchId: 'match-002',
      map: 'de_mirage',
      date: DateTime(2026, 4, 30, 17, 15),
      durationMinutes: 41,
      result: MatchResult.loss,
    ),
    MatchEntity(
      matchId: 'match-003',
      map: 'de_inferno',
      date: DateTime(2026, 4, 29, 22, 30),
      durationMinutes: 28,
      result: MatchResult.win,
    ),
    MatchEntity(
      matchId: 'match-004',
      map: 'de_nuke',
      date: DateTime(2026, 4, 29, 19, 0),
      durationMinutes: 45,
      result: MatchResult.loss,
    ),
    MatchEntity(
      matchId: 'match-005',
      map: 'de_ancient',
      date: DateTime(2026, 4, 28, 21, 0),
      durationMinutes: 35,
      result: MatchResult.win,
    ),
    MatchEntity(
      matchId: 'match-006',
      map: 'de_vertigo',
      date: DateTime(2026, 4, 28, 18, 30),
      durationMinutes: 38,
      result: MatchResult.draw,
    ),
    MatchEntity(
      matchId: 'match-007',
      map: 'de_overpass',
      date: DateTime(2026, 4, 27, 22, 0),
      durationMinutes: 29,
      result: MatchResult.win,
    ),
    MatchEntity(
      matchId: 'match-008',
      map: 'de_anubis',
      date: DateTime(2026, 4, 27, 19, 45),
      durationMinutes: 33,
      result: MatchResult.loss,
    ),
    MatchEntity(
      matchId: 'match-009',
      map: 'de_mirage',
      date: DateTime(2026, 4, 26, 21, 15),
      durationMinutes: 40,
      result: MatchResult.win,
    ),
    MatchEntity(
      matchId: 'match-010',
      map: 'de_dust2',
      date: DateTime(2026, 4, 26, 18, 0),
      durationMinutes: 27,
      result: MatchResult.loss,
    ),
  ];

  // ---------------------------------------------------------------------------
  // Player stats per match (searchedPlayer perspective)
  // rating: double 0.0–2.0 (HLTV 2.0 standard — resolved OQ-02)
  // ---------------------------------------------------------------------------

  static final List<PlayerMatchStatsEntity> matchStats = [
    const PlayerMatchStatsEntity(
      matchId: 'match-001',
      player: searchedPlayer,
      kills: 24,
      assists: 5,
      deaths: 14,
      rating: 1.45,
      headshots: 11,
      mvpCount: 3,
      score: 78,
      team: 'CT',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-002',
      player: searchedPlayer,
      kills: 12,
      assists: 3,
      deaths: 19,
      rating: 0.72,
      headshots: 5,
      mvpCount: 0,
      score: 41,
      team: 'T',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-003',
      player: searchedPlayer,
      kills: 20,
      assists: 7,
      deaths: 13,
      rating: 1.38,
      headshots: 9,
      mvpCount: 2,
      score: 65,
      team: 'CT',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-004',
      player: searchedPlayer,
      kills: 11,
      assists: 4,
      deaths: 20,
      rating: 0.65,
      headshots: 4,
      mvpCount: 0,
      score: 38,
      team: 'T',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-005',
      player: searchedPlayer,
      kills: 22,
      assists: 6,
      deaths: 15,
      rating: 1.31,
      headshots: 10,
      mvpCount: 2,
      score: 72,
      team: 'CT',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-006',
      player: searchedPlayer,
      kills: 17,
      assists: 8,
      deaths: 17,
      rating: 1.02,
      headshots: 7,
      mvpCount: 1,
      score: 55,
      team: 'T',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-007',
      player: searchedPlayer,
      kills: 25,
      assists: 4,
      deaths: 12,
      rating: 1.62,
      headshots: 14,
      mvpCount: 4,
      score: 83,
      team: 'CT',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-008',
      player: searchedPlayer,
      kills: 10,
      assists: 2,
      deaths: 18,
      rating: 0.58,
      headshots: 3,
      mvpCount: 0,
      score: 34,
      team: 'T',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-009',
      player: searchedPlayer,
      kills: 19,
      assists: 5,
      deaths: 14,
      rating: 1.24,
      headshots: 8,
      mvpCount: 1,
      score: 62,
      team: 'CT',
    ),
    const PlayerMatchStatsEntity(
      matchId: 'match-010',
      player: searchedPlayer,
      kills: 14,
      assists: 3,
      deaths: 17,
      rating: 0.88,
      headshots: 6,
      mvpCount: 1,
      score: 47,
      team: 'T',
    ),
  ];
}

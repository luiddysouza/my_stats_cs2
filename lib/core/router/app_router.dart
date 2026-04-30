import 'package:go_router/go_router.dart';
import 'package:my_stats_cs2/features/matches/presentation/screens/match_detail_screen.dart';
import 'package:my_stats_cs2/features/matches/presentation/screens/match_list_screen.dart';
import 'package:my_stats_cs2/features/search/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/matches',
      builder: (context, state) {
        final steamId = state.extra as String?;
        return MatchListScreen(steamId: steamId ?? '');
      },
    ),
    GoRoute(
      path: '/matches/:matchId',
      builder: (context, state) {
        final matchId = state.pathParameters['matchId'] ?? '';
        return MatchDetailScreen(matchId: matchId);
      },
    ),
  ],
);

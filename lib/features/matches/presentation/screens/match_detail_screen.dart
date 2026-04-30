import 'package:flutter/material.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({super.key, required this.matchId});

  final String matchId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhe da Partida')),
      body: Center(
        child: Text('Match Detail Screen — matchId: $matchId — placeholder'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({super.key, required this.steamId});

  final String steamId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Partidas Recentes')),
      body: Center(
        child: Text('Match List Screen — steamId: $steamId — placeholder'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

class ScoreCard extends StatelessWidget {
  final int score;

  const ScoreCard({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        '${AppStrings.score}: $score',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
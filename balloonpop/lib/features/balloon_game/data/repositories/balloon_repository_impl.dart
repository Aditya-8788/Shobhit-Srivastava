import 'dart:math';
import 'package:flutter/material.dart';
// import 'dart:math';
import 'package:balloonpop/features/balloon_game/data/models/balloon_model.dart';
// import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/balloon_entity.dart';
import '../../domain/repositories/balloon_repository.dart';
//import '../models/bolloon_model.dart';

class BalloonRepositoryImpl implements BalloonRepository {
  @override
  @override
List<BalloonEntity> generateBalloons() {
  final random = Random();

  final colors = [
    AppColors.balloonRed,
    AppColors.balloonBlue,
    AppColors.balloonGreen,
    AppColors.balloonYellow,
    Colors.purple,
  ];

  final List<BalloonEntity> balloons = [];

  const double balloonWidth = 90;
  const double balloonHeight = 140;
  const double maxLeft = 280;
  const double minTop = 100;
  const double maxTop = 550;
  const double minDistance = 120;

  for (int i = 0; i < 5; i++) {
    double left = 0;
    double top = 0;
    bool isOverlapping = true;
    int attempts = 0;

    while (isOverlapping && attempts < 100) {
      left = random.nextDouble() * maxLeft;
      top = minTop + random.nextDouble() * (maxTop - minTop);

      isOverlapping = balloons.any((balloon) {
        final dx = (balloon.left - left).abs();
        final dy = (balloon.top - top).abs();

        return dx < minDistance && dy < minDistance;
      });

      attempts++;
    }

    balloons.add(
      BalloonModel(
        id: i + 1,
        color: colors[i],
        left: left,
        top: top,
        isPopped: false,
      ),
    );
  }

  return balloons;
}

  @override
  List<BalloonEntity> popBalloon({
    required List<BalloonEntity> balloons,
    required int balloonId,
  }) {
    return balloons.map((balloon) {
      if (balloon.id == balloonId) {
        return BalloonModel(
          id: balloon.id,
          color: balloon.color,
          left: balloon.left,
          top: balloon.top,
          isPopped: true,
        );
      }
      return balloon;
    }).toList();
  }
}
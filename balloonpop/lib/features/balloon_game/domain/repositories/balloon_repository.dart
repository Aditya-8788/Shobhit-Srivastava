import '../entities/balloon_entity.dart';

abstract class BalloonRepository {
  List<BalloonEntity> generateBalloons();

  List<BalloonEntity> popBalloon({
    required List<BalloonEntity> balloons,
    required int balloonId,
  });
}
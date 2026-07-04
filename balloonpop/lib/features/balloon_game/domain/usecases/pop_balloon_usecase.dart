import '../entities/balloon_entity.dart';
import '../repositories/balloon_repository.dart';

class PopBalloonUseCase {
  final BalloonRepository repository;

  PopBalloonUseCase(this.repository);

  List<BalloonEntity> call({
    required List<BalloonEntity> balloons,
    required int balloonId,
  }) {
    return repository.popBalloon(
      balloons: balloons,
      balloonId: balloonId,
    );
  }
}
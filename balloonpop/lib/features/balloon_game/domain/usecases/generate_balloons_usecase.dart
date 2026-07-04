import '../entities/balloon_entity.dart';
import '../repositories/balloon_repository.dart';

class GenerateBalloonsUseCase {
  final BalloonRepository repository;

  GenerateBalloonsUseCase(this.repository);

  List<BalloonEntity> call() {
    return repository.generateBalloons();
  }
}
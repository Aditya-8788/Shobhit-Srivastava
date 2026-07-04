// import '../entities/detected_item_entity.dart';
// import '../repositories/fruit_hunt_repository.dart';

// class DetectItemUseCase {
//   final FruitHuntRepository repository;

//   const DetectItemUseCase(this.repository);

//   Future<DetectedItemEntity> call(String label) async {
//     return repository.detectItem(label);
//   }
// }
import 'dart:io';

import '../entities/detected_item_entity.dart';
import '../repositories/fruit_hunt_repository.dart';

class DetectItemUseCase {
  final FruitHuntRepository repository;

  DetectItemUseCase(this.repository);

  Future<DetectedItemEntity> call(
    File imageFile,
  ) async {
    return await repository.detectItem(
      imageFile,
    );
  }
}
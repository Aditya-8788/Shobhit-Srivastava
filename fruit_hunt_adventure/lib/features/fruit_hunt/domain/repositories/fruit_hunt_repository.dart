// import '../entities/detected_item_entity.dart';

// abstract class FruitHuntRepository {
//   Future<DetectedItemEntity> detectItem(String label);
//   Future<bool> checkFruit(String label);
// }
import 'dart:io';

import '../entities/detected_item_entity.dart';

abstract class FruitHuntRepository {
  Future<DetectedItemEntity> detectItem(
    File imageFile,
  );

  bool checkFruit(
    String label,
  );
}
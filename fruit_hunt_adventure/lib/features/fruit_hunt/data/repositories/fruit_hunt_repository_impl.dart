// import '../../domain/entities/detected_item_entity.dart';
// import '../../domain/repositories/fruit_hunt_repository.dart';

// class FruitHuntRepositoryImpl implements FruitHuntRepository {
//   @override
//   Future<DetectedItemEntity> detectItem(String label) async {
//     return DetectedItemEntity(name: label, isCorrect: true);
//   }

//   @override
//   Future<bool> checkFruit(String label) async {
//     return label.toLowerCase() == 'apple';
//   }
// }
import 'dart:io';

import '../../domain/entities/detected_item_entity.dart';
import '../../domain/repositories/fruit_hunt_repository.dart';
import '../datasources/fruit_label_datasource.dart';

class FruitHuntRepositoryImpl implements FruitHuntRepository {
  final FruitLabelDataSource dataSource;

  FruitHuntRepositoryImpl(this.dataSource);

  @override
  Future<DetectedItemEntity> detectItem(File imageFile) async {
    return await dataSource.detectItem(imageFile);
  }

  @override
  bool checkFruit(String label) {
    final foodKeywords = [
    'food',
    'fruit',
    'vegetable',
    'snack',
    'meal',
    'dish',
    'bread',
    'rice',
    'pizza',
    'burger',
    'sandwich',
    'cake',
    'cookie',
    'biscuit',
    'chocolate',
    'ice cream',
    'apple',
    'banana',
    'orange',
    'mango',
    'grape',
    'potato',
    'tomato',
    'carrot',
    'onion',
    'egg',
    'milk',
    'cheese',
    'paneer',
  ];

    final lowerLabel = label.toLowerCase();

    return foodKeywords.any(
      (food) => lowerLabel.contains(food),
    );
  }
}
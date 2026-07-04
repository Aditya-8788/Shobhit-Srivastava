// abstract class FruitLabelDataSource {
//   Future<List<String>> getFruitLabels();
// }

// class FruitLabelDataSourceImpl implements FruitLabelDataSource {
//   @override
//   Future<List<String>> getFruitLabels() async {
//     return ['Apple', 'Banana', 'Orange'];
//   }
// }
import 'dart:io';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

import '../models/detected_item_model.dart';

class FruitLabelDataSource {
  final ImageLabeler _imageLabeler = ImageLabeler(
    options: ImageLabelerOptions(
      confidenceThreshold: 0.5,
    ),
  );

  final List<String> foodKeywords = const [
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

  Future<DetectedItemModel> detectItem(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);

    final labels = await _imageLabeler.processImage(inputImage);

    if (labels.isEmpty) {
      return const DetectedItemModel(
        label: 'Unknown',
        confidence: 0.0,
        isFruit: false,
      );
    }

    final bestLabel = labels.first;
    final labelText = bestLabel.label.toLowerCase();

    final isFruit = foodKeywords.any(
      (food) => labelText.contains(food),
    );

    return DetectedItemModel(
      label: bestLabel.label,
      confidence: bestLabel.confidence,
      isFruit: isFruit,
    );
  }

  Future<void> close() async {
    await _imageLabeler.close();
  }
}
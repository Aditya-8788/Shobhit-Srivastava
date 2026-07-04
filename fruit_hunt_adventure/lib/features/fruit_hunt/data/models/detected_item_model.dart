// class DetectedItemModel {
//   final String name;
//   final bool isCorrect;

//   const DetectedItemModel({required this.name, required this.isCorrect});

//   factory DetectedItemModel.fromJson(Map<String, dynamic> json) {
//     return DetectedItemModel(
//       name: json['name'] as String,
//       isCorrect: json['isCorrect'] as bool,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'isCorrect': isCorrect,
//     };
//   }
// }
import '../../domain/entities/detected_item_entity.dart';

class DetectedItemModel extends DetectedItemEntity {
  const DetectedItemModel({
    required super.label,
    required super.confidence,
    required super.isFruit,
  });

  factory DetectedItemModel.fromLabel({
    required String label,
    required double confidence,
    required bool isFruit,
  }) {
    return DetectedItemModel(
      label: label,
      confidence: confidence,
      isFruit: isFruit,
    );
  }
}
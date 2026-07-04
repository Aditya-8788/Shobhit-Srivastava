// class DetectedItemEntity {
//   final String name;
//   final bool isCorrect;

//   const DetectedItemEntity({required this.name, required this.isCorrect});
// }
import 'package:equatable/equatable.dart';

class DetectedItemEntity extends Equatable {
  final String label;
  final double confidence;
  final bool isFruit;

  const DetectedItemEntity({
    required this.label,
    required this.confidence,
    required this.isFruit,
  });

  @override
  List<Object?> get props => [
        label,
        confidence,
        isFruit,
      ];
}
// import 'package:flutter/material.dart';

// class DetectedItemCard extends StatelessWidget {
//   const DetectedItemCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Card(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Text('Detected Item'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/detected_item_entity.dart';

class DetectedItemCard extends StatelessWidget {
  final DetectedItemEntity detectedItem;
  final String message;

  const DetectedItemCard({
    super.key,
    required this.detectedItem,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final confidence = (detectedItem.confidence * 100).toStringAsFixed(1);

    return Card(
      elevation: 4,
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: detectedItem.isFruit
                    ? AppColors.success
                    : AppColors.error,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Detected: ${detectedItem.label}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Confidence: $confidence%',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
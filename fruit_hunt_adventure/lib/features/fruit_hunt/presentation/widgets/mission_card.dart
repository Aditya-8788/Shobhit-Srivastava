// import 'package:flutter/material.dart';

// class MissionCard extends StatelessWidget {
//   const MissionCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Card(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Text('Mission'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class MissionCard extends StatelessWidget {
  const MissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 5,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.local_florist,
              size: 70,
              color: AppColors.primary,
            ),
            SizedBox(height: 12),
            Text(
              AppStrings.missionTitle,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 10),
            Text(
              AppStrings.missionSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
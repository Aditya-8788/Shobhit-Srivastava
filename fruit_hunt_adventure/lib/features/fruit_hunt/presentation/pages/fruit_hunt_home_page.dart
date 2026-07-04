// import 'package:flutter/material.dart';

// class FruitHuntHomePage extends StatelessWidget {
//   const FruitHuntHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Fruit Hunt Home'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/permissions/camera_permission.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/mission_card.dart';
import 'camera_page.dart';

class FruitHuntHomePage extends StatelessWidget {
  const FruitHuntHomePage({super.key});

  Future<void> _startGame(BuildContext context) async {
    final hasPermission = await CameraPermission.requestPermission();

    if (!context.mounted) return;

    if (hasPermission) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CameraPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.permissionDenied),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MissionCard(),
              const SizedBox(height: 40),
              CustomButton(
                text: AppStrings.startGame,
                icon: Icons.camera_alt,
                onPressed: () => _startGame(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
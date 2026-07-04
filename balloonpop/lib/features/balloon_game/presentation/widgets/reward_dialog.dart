import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';

class RewardDialog extends StatelessWidget {
  final VoidCallback onRestart;

  const RewardDialog({
    super.key,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Great Job! ⭐'),
      content: const Text(
        AppStrings.gameCompleted,
        style: TextStyle(fontSize: 18),
      ),
      actions: [
        CustomButton(
          text: AppStrings.restart,
          onPressed: onRestart,
        ),
      ],
    );
  }
}
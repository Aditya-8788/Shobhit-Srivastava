// import 'package:flutter/material.dart';

// class CameraButton extends StatelessWidget {
//   const CameraButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {},
//       child: const Icon(Icons.camera_alt),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CameraButton extends StatelessWidget {
  final VoidCallback onTap;

  const CameraButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      backgroundColor: AppColors.primary,
      onPressed: onTap,
      child: const Icon(
        Icons.camera_alt,
        color: Colors.white,
        size: 34,
      ),
    );
  }
}
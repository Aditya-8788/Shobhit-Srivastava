// import 'package:flutter/material.dart';

// class StarRewardWidget extends StatelessWidget {
//   const StarRewardWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       children: [Icon(Icons.star, color: Colors.amber), Text('Reward')],
//     );
//   }
// }
// // 
import 'package:flutter/material.dart';

class StarRewardWidget extends StatelessWidget {
  final int score;

  const StarRewardWidget({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Icon(
          index < score ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 36,
        ),
      ),
    );
  }
}
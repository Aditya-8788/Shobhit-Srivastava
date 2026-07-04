// import 'package:flutter/material.dart';

// class RewardPage extends StatelessWidget {
//   const RewardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Reward Page'),
//       ),
//     );
//   }
// }
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../bloc/fruit_hunt_bloc.dart';
import '../bloc/fruit_hunt_event.dart';
import 'fruit_hunt_home_page.dart';

class RewardPage extends StatefulWidget {
  final int score;

  const RewardPage({
    super.key,
    required this.score,
  });

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );

    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _playAgain() {
    context.read<FruitHuntBloc>().add(ResetFruitHuntEvent());

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const FruitHuntHomePage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '🏆',
                      style: TextStyle(fontSize: 80),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      AppStrings.gameCompleted,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'You collected ${widget.score} stars ⭐',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: AppStrings.playAgain,
                      icon: Icons.restart_alt,
                      onPressed: _playAgain,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
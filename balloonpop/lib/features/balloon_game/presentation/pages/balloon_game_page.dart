import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/audio_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../bloc/balloon_bloc.dart';
import '../bloc/balloon_event.dart';
import '../bloc/balloon_state.dart';
import '../widgets/balloon_widget.dart';
import '../widgets/reward_dialog.dart';
import '../widgets/score_card.dart';

class BalloonGamePage extends StatefulWidget {
  const BalloonGamePage({super.key});

  @override
  State<BalloonGamePage> createState() => _BalloonGamePageState();
}

class _BalloonGamePageState extends State<BalloonGamePage> {
  @override
  void initState() {
    super.initState();
    context.read<BalloonBloc>().add(LoadBalloonsEvent());
  }

  void _showRewardDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return RewardDialog(
          onRestart: () {
            Navigator.pop(context);
            context.read<BalloonBloc>().add(ResetGameEvent());
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BalloonBloc, BalloonState>(
      listener: (context, state) {
        if (state is BalloonCompleted) {
          Future.delayed(
            const Duration(milliseconds: 300),
            _showRewardDialog,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(AppStrings.appName),
          centerTitle: true,
        ),
        body: BlocBuilder<BalloonBloc, BalloonState>(
          builder: (context, state) {
            if (state is BalloonInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            final balloons = state is BalloonLoaded
                ? state.balloons
                : state is BalloonCompleted
                    ? state.balloons
                    : [];

            final score = state is BalloonLoaded
                ? state.score
                : state is BalloonCompleted
                    ? state.score
                    : 0;

            return Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: ScoreCard(score: score),
                ),

                ...balloons.map(
                  (balloon) => BalloonWidget(
                    balloon: balloon,
                   onTap: () {
                    print("Tapped balloon id: ${balloon.id}");

                      context.read<BalloonBloc>().add(
                      PopBalloonEvent(balloonId: balloon.id),
                    );

                    AudioHelper.playPopSound();
                    },
                  ),
                ),

                Positioned(
                  bottom: 30,
                  left: 90,
                  right: 90,
                  child: CustomButton(
                    text: AppStrings.restart,
                    onPressed: () {
                      context.read<BalloonBloc>().add(ResetGameEvent());
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
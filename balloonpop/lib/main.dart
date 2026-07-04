import 'package:balloonpop/features/balloon_game/presentation/pages/balloon_game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'features/balloon_game/data/repositories/balloon_repository_impl.dart';
import 'features/balloon_game/domain/usecases/generate_balloons_usecase.dart';
import 'features/balloon_game/domain/usecases/pop_balloon_usecase.dart';
import 'features/balloon_game/presentation/bloc/balloon_bloc.dart';
import 'features/balloon_game/presentation/bloc/balloon_event.dart';

void main() {
  final balloonRepository = BalloonRepositoryImpl();

  runApp(
    MyApp(
      generateBalloonsUseCase: GenerateBalloonsUseCase(balloonRepository),
      popBalloonUseCase: PopBalloonUseCase(balloonRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GenerateBalloonsUseCase generateBalloonsUseCase;
  final PopBalloonUseCase popBalloonUseCase;

  const MyApp({
    super.key,
    required this.generateBalloonsUseCase,
    required this.popBalloonUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BalloonBloc(
        generateBalloonsUseCase: generateBalloonsUseCase,
        popBalloonUseCase: popBalloonUseCase,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Balloon Pop Adventure',
        theme: AppTheme.lightTheme,
        home: const BalloonGamePage(),
      ),
    );
  }
}
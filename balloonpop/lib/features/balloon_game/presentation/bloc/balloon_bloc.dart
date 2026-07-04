// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'balloon_event.dart';
// part 'balloon_state.dart';

// class BalloonBloc extends Bloc<BalloonEvent, BalloonState> {
//   BalloonBloc() : super(BalloonInitial()) {
//     on<BalloonEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/generate_balloons_usecase.dart';
import '../../domain/usecases/pop_balloon_usecase.dart';
import 'balloon_event.dart';
import 'balloon_state.dart';

class BalloonBloc extends Bloc<BalloonEvent, BalloonState> {
  final GenerateBalloonsUseCase generateBalloonsUseCase;
  final PopBalloonUseCase popBalloonUseCase;

  BalloonBloc({
    required this.generateBalloonsUseCase,
    required this.popBalloonUseCase,
  }) : super(BalloonInitial()) {
    on<LoadBalloonsEvent>(_onLoadBalloons);
    on<PopBalloonEvent>(_onPopBalloon);
    on<ResetGameEvent>(_onResetGame);
  }

  void _onLoadBalloons(
    LoadBalloonsEvent event,
    Emitter<BalloonState> emit,
  ) {
    final balloons = generateBalloonsUseCase();

    emit(
      BalloonLoaded(
        balloons: balloons,
        score: 0,
      ),
    );
  }

 void _onPopBalloon(
  PopBalloonEvent event,
  Emitter<BalloonState> emit,
) {
  if (state is! BalloonLoaded) return;

  final currentState = state as BalloonLoaded;

  final selectedBalloon = currentState.balloons.firstWhere(
    (balloon) => balloon.id == event.balloonId,
  );

  if (selectedBalloon.isPopped) return;

  final updatedBalloons = popBalloonUseCase(
    balloons: currentState.balloons,
    balloonId: event.balloonId,
  );

  final newScore = currentState.score + 1;

  final isCompleted = updatedBalloons.every(
    (balloon) => balloon.isPopped,
  );

  if (isCompleted) {
    emit(
      BalloonCompleted(
        balloons: updatedBalloons,
        score: newScore,
      ),
    );
  } else {
    emit(
      BalloonLoaded(
        balloons: updatedBalloons,
        score: newScore,
      ),
    );
  }
}

  void _onResetGame(
    ResetGameEvent event,
    Emitter<BalloonState> emit,
  ) {
    final balloons = generateBalloonsUseCase();

    emit(
      BalloonLoaded(
        balloons: balloons,
        score: 0,
      ),
    );
  }
}
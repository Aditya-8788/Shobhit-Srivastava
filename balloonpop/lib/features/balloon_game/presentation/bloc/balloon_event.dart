// part of 'balloon_bloc.dart';

// sealed class BalloonEvent extends Equatable {
//   const BalloonEvent();

//   @override
//   List<Object> get props => [];
// }
import 'package:equatable/equatable.dart';

abstract class BalloonEvent extends Equatable {
  const BalloonEvent();

  @override
  List<Object?> get props => [];
}

class LoadBalloonsEvent extends BalloonEvent {}

class PopBalloonEvent extends BalloonEvent {
  final int balloonId;

  const PopBalloonEvent({required this.balloonId});

  @override
  List<Object?> get props => [balloonId];
}

class ResetGameEvent extends BalloonEvent {}
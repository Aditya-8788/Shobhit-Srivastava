// part of 'balloon_bloc.dart';

// sealed class BalloonState extends Equatable {
//   const BalloonState();
  
//   @override
//   List<Object> get props => [];
// }

// final class BalloonInitial extends BalloonState {}
import 'package:equatable/equatable.dart';

import '../../domain/entities/balloon_entity.dart';

abstract class BalloonState extends Equatable {
  const BalloonState();

  @override
  List<Object?> get props => [];
}

class BalloonInitial extends BalloonState {}

class BalloonLoaded extends BalloonState {
  final List<BalloonEntity> balloons;
  final int score;

  const BalloonLoaded({
    required this.balloons,
    required this.score,
  });

  @override
  List<Object?> get props => [balloons, score];
}

class BalloonCompleted extends BalloonState {
  final List<BalloonEntity> balloons;
  final int score;

  const BalloonCompleted({
    required this.balloons,
    required this.score,
  });

  @override
  List<Object?> get props => [balloons, score];
}
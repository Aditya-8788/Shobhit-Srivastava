// abstract class FruitHuntState {}

// class FruitHuntInitial extends FruitHuntState {}

// class FruitHuntLoaded extends FruitHuntState {}
import 'package:equatable/equatable.dart';

import '../../domain/entities/detected_item_entity.dart';

abstract class FruitHuntState extends Equatable {
  const FruitHuntState();

  @override
  List<Object?> get props => [];
}

class FruitHuntInitial extends FruitHuntState {}

class FruitHuntLoading extends FruitHuntState {}

class FruitHuntLoaded extends FruitHuntState {
  final int score;
  final DetectedItemEntity? detectedItem;
  final String message;

  const FruitHuntLoaded({
    required this.score,
    this.detectedItem,
    required this.message,
  });

  @override
  List<Object?> get props => [score, detectedItem, message];
}

class FruitHuntCompleted extends FruitHuntState {
  final int score;

  const FruitHuntCompleted({required this.score});

  @override
  List<Object?> get props => [score];
}

class FruitHuntError extends FruitHuntState {
  final String message;

  const FruitHuntError({required this.message});

  @override
  List<Object?> get props => [message];
}
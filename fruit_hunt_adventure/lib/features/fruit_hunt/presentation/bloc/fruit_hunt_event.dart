// abstract class FruitHuntEvent {}

// class StartHuntEvent extends FruitHuntEvent {}
import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class FruitHuntEvent extends Equatable {
  const FruitHuntEvent();

  @override
  List<Object?> get props => [];
}

class DetectFruitEvent extends FruitHuntEvent {
  final File imageFile;

  const DetectFruitEvent({required this.imageFile});

  @override
  List<Object?> get props => [imageFile];
}

class ResetFruitHuntEvent extends FruitHuntEvent {}
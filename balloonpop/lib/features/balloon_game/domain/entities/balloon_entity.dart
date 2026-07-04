import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BalloonEntity extends Equatable {
  final int id;
  final Color color;
  final double left;
  final double top;
  final bool isPopped;

  const BalloonEntity({
    required this.id,
    required this.color,
    required this.left,
    required this.top,
    required this.isPopped,
  });

  @override
  List<Object?> get props => [
        id,
        color,
        left,
        top,
        isPopped,
      ];
}
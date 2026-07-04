import 'package:flutter/material.dart';

import '../../domain/entities/balloon_entity.dart';

class BalloonModel extends BalloonEntity {
  const BalloonModel({
    required super.id,
    required super.color,
    required super.left,
    required super.top,
    required super.isPopped,
  });

  factory BalloonModel.fromMap(Map<String, dynamic> map) {
    return BalloonModel(
      id: map['id'] as int,
      color: map['color'] as Color,
      left: map['left'] as double,
      top: map['top'] as double,
      isPopped: map['isPopped'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'color': color,
      'left': left,
      'top': top,
      'isPopped': isPopped,
    };
  }

  BalloonModel copyWith({
    int? id,
    Color? color,
    double? left,
    double? top,
    bool? isPopped,
  }) {
    return BalloonModel(
      id: id ?? this.id,
      color: color ?? this.color,
      left: left ?? this.left,
      top: top ?? this.top,
      isPopped: isPopped ?? this.isPopped,
    );
  }
}
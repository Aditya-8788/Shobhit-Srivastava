import 'package:flutter/material.dart';

import '../../domain/entities/balloon_entity.dart';

class BalloonWidget extends StatefulWidget {
  final BalloonEntity balloon;
  final VoidCallback onTap;

  const BalloonWidget({
    super.key,
    required this.balloon,
    required this.onTap,
  });

  @override
  State<BalloonWidget> createState() => _BalloonWidgetState();
}

class _BalloonWidgetState extends State<BalloonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(
      begin: 0,
      end: -18,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.balloon.left,
      top: widget.balloon.top,
      child: widget.balloon.isPopped
          ? const SizedBox.shrink()
          : AnimatedBuilder(
              animation: _floatAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _floatAnimation.value),
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: widget.onTap,
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 95,
                      decoration: BoxDecoration(
                        color: widget.balloon.color,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: widget.balloon.color.withValues(alpha: 0.8),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 35,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
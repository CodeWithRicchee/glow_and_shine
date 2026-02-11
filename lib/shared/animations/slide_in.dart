import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SlideIn extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset offset;

  const SlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 500),
    this.offset = const Offset(0, 30),
  });

  factory SlideIn.fromLeft({
    Key? key,
    required Widget child,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 500),
  }) => SlideIn(
    key: key,
    delay: delay,
    duration: duration,
    offset: const Offset(-30, 0),
    child: child,
  );

  factory SlideIn.fromRight({
    Key? key,
    required Widget child,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 500),
  }) => SlideIn(
    key: key,
    delay: delay,
    duration: duration,
    offset: const Offset(30, 0),
    child: child,
  );

  @override
  Widget build(BuildContext context) {
    return child
        .animate(delay: delay)
        .fadeIn(duration: duration, curve: Curves.easeOut)
        .slideX(
          begin: offset.dx / 100,
          end: 0,
          duration: duration,
          curve: Curves.easeOut,
        )
        .slideY(
          begin: offset.dy / 100,
          end: 0,
          duration: duration,
          curve: Curves.easeOut,
        );
  }
}
